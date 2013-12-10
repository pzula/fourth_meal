class StaticPagesController < ApplicationController

  def home
    @restaurant = Restaurant.all
  end
  
end
