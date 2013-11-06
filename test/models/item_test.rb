require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "item invalid without title" do
    item = Item.new({description: 'tasty', price: '3', category: 'bread'})
    refute item.save
  end

  test "item invalid without description" do
    item = Item.new({title: 'tasty', price: '3', category: 'bread'})
    refute item.save
  end

  test "item invalid without price" do
    item = Item.new({title: 'tasty', description: '3', category: 'bread'})
    refute item.save
  end

  test "item invalid without category" do
    item = Item.new({title: 'tasty', description: '3', price:'bread'})
    refute item.save
  end

  test "class method active returns active items" do
    Item.create({title: 'tasty', description: '3', price:'bread', category: 'snack'})
    Item.create({title: 'smelly', description: '5', price:'3', category: 'snack', active: false})

    assert_equal 1, Item.active.count
  end
end
