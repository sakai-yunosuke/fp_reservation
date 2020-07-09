class ScheduleValidator < ActiveModel::Validator
  def validate(record)
    return if !record.start_time.present?

    start_time_cannot_be_in_the_past(record)
    start_time_should_be_every_half_hour(record)
    business_hour_on_weekday(record)
    business_hour_on_saturday(record)
    close_on_sunday(record)
  end

  def start_time_cannot_be_in_the_past(record)
    if record.start_time < DateTime.now
      record.errors.add(:start_time, ': 過去の日付を選択することは出来ません')
    end
  end

  def start_time_should_be_every_half_hour(record)
    if record.start_time.min % 30 != 0
      record.errors.add(:start_time, ': 開始時刻は毎時0分、または30分です')
    end
  end

  def business_hour_on_weekday(record)
    is_weekday = record.start_time.wday % 6 != 0

    if is_weekday && (record.start_time.hour < 10 || 17 < record.start_time.hour)
      record.errors.add(:start_time, ': 平日の開始時刻は10:00~17:30内です')
    end
  end

  def business_hour_on_saturday(record)
    is_saturday = record.start_time.wday == 6

    if is_saturday && (record.start_time.hour < 11 || 14 < record.start_time.hour)
      record.errors.add(:start_time, ': 土曜日の開始時刻は11:00~14:30内です')
    end
  end

  def close_on_sunday(record)
    is_sunday = record.start_time.wday == 0

    if is_sunday
      record.errors.add(:start_time, ': 日曜日は休業日です')
    end
  end
end
