class LocationsController < ApplicationController

  def index
    @locations = Location.all.sort
  end

end
