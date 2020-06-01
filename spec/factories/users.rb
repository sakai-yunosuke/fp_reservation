FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'passpass' }
    password_confirmation { 'passpass' }

    trait :invalid do
      password_confirmation { 'different' }
    end
  end
end
