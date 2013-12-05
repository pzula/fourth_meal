require 'spec_helper'

describe Item do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:description)}

  it "has method active that returns actice items" do
    Item.create({title: 'tasty', description: '3', price:'bread'})
    Item.create({title: 'smelly', description: '5', price:'3', active: false})

    expect(Item.active.count).to eq(1)
  end

  it "can attach image when editing" do
    @item = Item.new({title: 'eggs', description: 'tasty', price: '3'})
    @item.image = File.new("test/fixtures/deviled_eggs.jpg")
    @item.save
    expect(@item.image_file_name).to eq("deviled_eggs.jpg")
  end
end
