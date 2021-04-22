FactoryBot.define do
  factory :meter do
    name { "MyString" }
    start { Date.yesterday }
    finish { Date.tomorrow }
    interval { 1.month }
    unit { "kWh" }
  end
end
