class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validate :user_cannot_reserve_at_the_same_time

  def user_cannot_reserve_at_the_same_time
    return if user.nil? || schedule.nil?

    current_reservation_time = schedule.start_time

    if Schedule.joins(:reservation).where(start_time: current_reservation_time).merge(Reservation.where(user_id: user.id)).count >= 1
      errors.add(:schedule, ': 同じ時間帯に他の予約が入っています')
    end
  end
end
