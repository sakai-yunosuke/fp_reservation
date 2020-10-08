class UsersController < ApplicationController
  before_action :login_required, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the fp reservation!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      @events = Schedule.where(user: @user) + Reservation.where(user: @user)
    else
      flash[:danger] = '存在しないユーザーです'
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザー情報が更新されました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def login_required
    if !logged_in?
      flash[:danger] = 'ログインが必要です'
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])

    if @user != current_user
      flash[:danger] = '不適切なユーザーです'
      redirect_to root_path
    end
  end
end
