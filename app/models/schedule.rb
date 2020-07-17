class Schedule < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true, uniqueness: { scope: :user }
  validates_with ScheduleValidator

  def end_time
    self.start_time + 30.minutes
  end
end
