class Schedule < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true, uniqueness: { scope: :user }
  validate :start_time_cannot_be_in_the_past,
    :start_time_should_be_every_half_hour,
    :business_hour_on_weekday,
    :business_hour_on_saturday,
    :close_on_sunday

  private

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time < DateTime.now
      errors.add(:start_time, ': 過去の日付を選択することは出来ません')
    end
  end

  def start_time_should_be_every_half_hour
    if start_time.present? && start_time.min % 30 != 0
      errors.add(:start_time, ': 開始時刻は毎時0分、または30分です')
    end
  end

  def business_hour_on_weekday
    is_weekday = start_time.present? && start_time.wday % 6 != 0

    if is_weekday && (start_time.hour < 10 || 17 < start_time.hour)
      errors.add(:start_time, ': 平日の開始時刻は10:00~17:30内です')
    end
  end

  def business_hour_on_saturday
    is_saturday = start_time.present? && start_time.wday == 6

    if is_saturday && (start_time.hour < 11 || 14 < start_time.hour)
      errors.add(:start_time, ': 土曜日の開始時刻は11:00~14:30内です')
    end
  end

  def close_on_sunday
    is_sunday = start_time.present? && start_time.wday == 0

    if is_sunday
      errors.add(:start_time, ': 日曜日は休業日です')
    end
  end
end
