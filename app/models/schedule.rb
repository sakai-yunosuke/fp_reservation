class Schedule < ApplicationRecord
  belongs_to :user
  has_one :reservation

  validates :start_time, presence: true, uniqueness: { scope: :user }
  validates_with ScheduleValidator
end
