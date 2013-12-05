FactoryGirl.define do
  factory :users do
    username "Joe"
    email "joe@example.com"
    password "password"
    password_confirmation "password"
  end
end
