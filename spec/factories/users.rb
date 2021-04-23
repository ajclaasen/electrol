FactoryBot.define do
  factory :employee, class: "User" do
    sequence(:email) { |n| "employee-#{n}@example.com" }
    password { "password" }
    role { :employee }
  end

  factory :manager, class: "User" do
    sequence(:email) { |n| "manager-#{n}@example.com" }
    password { "password" }
    role { :manager }
  end
end
