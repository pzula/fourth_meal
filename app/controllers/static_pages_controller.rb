class StaticPagesController < ApplicationController
  
  def home
    @restaurants = Restaurant.all
    @order = current_order
  end
  
end
