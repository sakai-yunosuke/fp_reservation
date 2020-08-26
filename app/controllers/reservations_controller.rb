class ReservationsController < ApplicationController
  def create
    begin
      current_user.reservations.create!(reservation_params)
      
      flash[:success] = '予約が完了しました'
      redirect_to current_user
    rescue ActiveRecord::RecordInvalid => e
      flash[:danger] = '予約に失敗しました、もう一度お試しください'
      redirect_to schedules_path
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
