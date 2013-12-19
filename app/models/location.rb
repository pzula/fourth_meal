class Location < ActiveRecord::Base
  has_many :restaurants

  def initiliaze
    @location = Location.all
  end

end


