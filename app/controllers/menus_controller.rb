class MenusController < ApplicationController

  def index
    @restaurant = params[:restaurant]
    @menu = Menu.new
  end

end
