class MenusController < ApplicationController

  def index
    @order = current_order
    @restaurant = params[:restaurant]
    #find_by_slug
    @menu = Menu.new
  end

end
