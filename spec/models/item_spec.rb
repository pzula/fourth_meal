require 'spec_helper'

describe Item do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:restaurant_id)}

  it "has method active that returns active items" do
    item = FactoryGirl.create(:item)
    inactive_item = FactoryGirl.build(:item, title: "Eggs", active: false)
    inactive_item.save
    expect(Item.active.count).to eq(1)
  end

  it "can attach image when editing" do
    item = FactoryGirl.build(:item)
    item.image = File.new("app/assets/images/deviled_eggs.jpg")
    item.save
    expect(item.image_file_name).to eq("deviled_eggs.jpg")
  end

  it "is associated with a specific restaurant" do
    item = FactoryGirl.build(:item)
    item.update_attributes(restaurant_id: 1)

    expect(item.restaurant_id).to eq(1)
  end
end
