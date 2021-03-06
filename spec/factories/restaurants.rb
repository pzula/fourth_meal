# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :url_slug do |n|
    "interstate-cafe#{n}"
  end

  factory :restaurant do
    name "Interstate Cafe"
    url_slug
    food_type "American"
  end
end
