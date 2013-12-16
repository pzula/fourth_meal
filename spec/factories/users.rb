FactoryGirl.define do
  factory :user do
    username "Joe"
    email "joe@example.com"
    password "password"
  end

  factory :user_admin, class: User do
    username "Admin"
    email "admin@example.com"
    password "password"
    admin true
  end
end
