FactoryGirl.define do
  factory :user_order, class: "Order" do
    association :customer, :factory => :user
  end

  factory :guest_order, class: "Order" do
    association :customer, :factory => :guest
  end
end
