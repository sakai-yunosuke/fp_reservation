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
    @schedules = Schedule.where(user: current_user)
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = 'スケジュールが登録されました'
      redirect_to current_user
    else
      render 'new'
    end
  end

  private
  
  def schedule_params
    params.require(:schedule).permit!
  end
end
