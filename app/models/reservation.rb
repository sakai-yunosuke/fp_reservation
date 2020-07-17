class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates :schedule, presence: true, uniqueness: { scope: :user }
end
