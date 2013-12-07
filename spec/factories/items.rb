FactoryGirl.define do
  factory :item do
    title "Bread"
    description "A delicious gluten treat"
    price '3'
    association :restaurant
  end
end
