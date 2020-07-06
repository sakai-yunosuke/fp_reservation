FactoryBot.define do
  factory :schedule do
    user { FactoryBot.build(:user) }

    now = Time.current
    start_time { now }

    monday_in_business_hour = now.beginning_of_week(:monday).since(1.week).change(hour: 12)
    saturday_in_business_hour = now.beginning_of_week(:saturday).since(1.week).change(hour: 12)

    trait :in_the_past do
      start_time { now.change(year: 2000) }
    end

    trait :not_every_half_hour do
      start_time { monday_in_business_hour.change(min: 15) }
    end

    trait :too_early_on_weekday do
      start_time { monday_in_business_hour.change(hour: 9) }
    end

    trait :too_late_on_weekday do
      start_time { monday_in_business_hour.change(hour: 18) }
    end

    trait :too_early_on_saturday do
      start_time { saturday_in_business_hour.change(hour: 10) }
    end

    trait :too_late_on_saturday do
      start_time { saturday_in_business_hour.change(hour: 15) }
    end

    trait :on_sunday do
      start_time { saturday_in_business_hour + 1.days }
    end
  end
end
