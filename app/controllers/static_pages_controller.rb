class StaticPagesController < ApplicationController
  
  def home
    @restaurants = Restaurant.all.page(params[:page]).per(5)
    @order = current_order
  end
  
end
