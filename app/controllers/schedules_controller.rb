class SchedulesController < ApplicationController
  def index
    @reservation = current_user.reservations.build

    if params[:start_time]
      @schedules = Schedule.where('start_time LIKE ?', "#{params[:start_time]}%")
    else
      @schedules = Schedule.where('start_time > ?', Time.now).order(:start_time)
    end
  end

  def new
    @schedule = current_user.schedules.build
    @events = Schedule.where(user: current_user) + Reservation.where(user: current_user)
  end

  def create
    begin
      current_user.schedules.create!(schedule_params)

      flash[:success] = 'スケジュールが登録されました'
      redirect_to current_user
    rescue ActiveRecord::RecordInvalid => e
      flash[:danger] = 'スケジュールの作成に失敗しました、もう一度お試しください'
      redirect_to new_schedule_path
    end
  end

  private
  
  def schedule_params
    params.require(:schedule).permit!
  end
end
