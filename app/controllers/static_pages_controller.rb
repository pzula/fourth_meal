class StaticPagesController < ApplicationController

  def home
    @restaurants = Restaurant.all
   
  end
  
end
