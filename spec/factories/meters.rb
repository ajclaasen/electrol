FactoryBot.define do
  factory :meter do
    name { "MyString" }
    start { Date.yesterday }
    finish { Date.tomorrow }
    interval { "M" }
    unit { "kWh" }
  end
end
