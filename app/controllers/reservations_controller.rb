class ReservationsController < ApplicationController
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = '予約が完了しました'
      redirect_to current_user
    else
      # TODO: 異常系の処理
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
