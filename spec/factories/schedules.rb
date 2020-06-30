FactoryBot.define do
  factory :schedule do
    user { FactoryBot.build(:user) }
    start_time { DateTime.new(2020, 7, 1, 10, 30, 0) }

    trait :in_the_past do
      start_time { DateTime.new(2000, 1, 1, 0, 0, 0) }
    end

    trait :not_every_half_hour do
      start_time { DateTime.new(2020, 7, 1, 12, 15, 0) }
    end

    trait :too_early_on_weekday do
      start_time { DateTime.new(2020, 7, 1, 9, 0, 0) }
    end

    trait :too_late_on_weekday do
      start_time { DateTime.new(2020, 7, 1, 18, 0, 0) }
    end

    trait :too_early_on_saturday do
      start_time { DateTime.new(2020, 7, 4, 10, 0, 0) }
    end

    trait :too_late_on_saturday do
      start_time { DateTime.new(2020, 7, 4, 15, 0, 0) }
    end

    trait :on_sunday do
      start_time { DateTime.new(2020, 7, 5, 12, 0, 0) }
    end
  end
end
