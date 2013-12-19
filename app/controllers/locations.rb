class LocationsController < ApplicationController

  def index
    @location = Location.all  
  end

  def show
    @location = Location.find(params[:id])
  end

end
