class Hours < ActiveRecord::Base
  belongs_to :restaurant

  def days
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end
end
