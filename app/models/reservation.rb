class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  delegate :start_time, to: :schedule

  validate :user_cannot_reserve_at_the_same_time

  def user_cannot_reserve_at_the_same_time
    return if user.nil? || schedule.nil?

    if Reservation.joins(:schedule).where(user: user).merge(Schedule.where(start_time: start_time)).count >= 1
      errors.add(:schedule, ': 同じ時間帯に他の予約が入っています')
    end
  end
end
