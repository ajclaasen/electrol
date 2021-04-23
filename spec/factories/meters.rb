FactoryBot.define do
  factory :meter do
    name { "MyString" }
    start { Date.yesterday }
    finish { Date.tomorrow }
    interval { 1.month }
    unit { "kWh" }

    trait :with_measurement do
      measurements { build_list :measurement, 1 }
    end

    trait :with_approved_measurement do
      measurements { build_list :measurement, 1, approved: true }
    end
  end
end
