FactoryGirl.define do
  factory :order_item do
    association :order
    association :item
  end
end
