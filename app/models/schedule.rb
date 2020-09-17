class Schedule < ApplicationRecord
  belongs_to :user
  has_one :reservation, dependent: :destroy

  validates :start_time, presence: true, uniqueness: { scope: :user }
  validates_with ScheduleValidator

  def end_time
    self.start_time + 30.minutes
  end

  def is_reserved?
    Reservation.where(schedule: self).count > 0
  end
end
