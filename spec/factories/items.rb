FactoryGirl.define do
  factory :item do
    title "Bread"
    description "A delicious gluten treat"
    price '3'
    association :restaurant
  end

  factory :item_unique, class: Item do
    title "French Bread"
    description "A delicious gluten treat"
    price '3'
  end
end
