class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validate :user_cannot_reserve_at_the_same_time

  def user_cannot_reserve_at_the_same_time
    return if user.nil? || schedule.nil?

    current_reservation = Reservation.find_by(user_id: user.id, schedule_id: schedule.id)
    return if current_reservation.nil?

    current_reservation_time = current_reservation.schedule.start_time

    if Schedule.where(user_id: user.id, start_time: current_reservation_time).count >= 1
      errors.add(:schedule, ': 同じ時間帯に他の予約が入っています')
    end
  end
end
