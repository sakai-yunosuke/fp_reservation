class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :require_login, :correct_user

  private

  def require_login
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
