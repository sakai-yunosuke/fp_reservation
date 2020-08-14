class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
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
