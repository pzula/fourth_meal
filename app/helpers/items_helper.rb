module ItemsHelper

  def item_params
    params.require(:item).permit(:title, :description, :price, :category)
  end

end
