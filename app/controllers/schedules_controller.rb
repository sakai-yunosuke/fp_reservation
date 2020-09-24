class SchedulesController < ApplicationController
  before_action :login, only: %i[index new create destroy]

  def index
    @reservation = current_user.reservations.build

    if params[:start_time]
      @schedules = Schedule.where('start_time LIKE ?', "#{params[:start_time]}%").page(params[:page])
    else
      @schedules = Schedule.where('start_time > ?', Time.now).order(:start_time).page(params[:page])
    end
  end

  def new
    @schedule = current_user.schedules.build
    @events = Schedule.where(user: current_user) + Reservation.where(user: current_user)
  end

  def create
    current_user.schedules.create!(schedule_params)

    flash[:success] = 'スケジュールが登録されました'
    redirect_to current_user
  rescue ActiveRecord::RecordInvalid => e
    flash[:danger] = 'スケジュールの作成に失敗しました、もう一度お試しください'
    redirect_to new_schedule_path
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:success] = 'スケジュールを削除しました'
    redirect_to current_user
  rescue ActiveRecord::RecordNotFound => e
    flash[:danger] = '選択したスケジュールが存在しません'
    redirect_to current_user
  end

  private
  
  def schedule_params
    params.require(:schedule).permit!
  end

  def login
    if !logged_in?
      flash[:danger] = 'ログインが必要です'
      redirect_to root_path
    end
  end
end
