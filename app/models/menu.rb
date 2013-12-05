class Menu

  def initialize
    @item = Item.all
  end

  def items_array
    @item
  end

end
