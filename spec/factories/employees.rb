FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "employee-#{n}@example.com" }
    password { "password" }
  end
end
