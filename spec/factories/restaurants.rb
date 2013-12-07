# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :url_slug do |n|
    "interstate-cafe#{n}"
  end

  factory :restaurant do
    name "Interstate Cafe"
    description "Delicious American food & spirits"
    url_slug
  end
end
