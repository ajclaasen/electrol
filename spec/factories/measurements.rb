FactoryBot.define do
  factory :measurement do
    meter
    amount { "9.99" }

    trait :approved do
      approved { true }
    end
  end
end
