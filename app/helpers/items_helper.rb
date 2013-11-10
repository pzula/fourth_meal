module ItemsHelper

  def item_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

end
