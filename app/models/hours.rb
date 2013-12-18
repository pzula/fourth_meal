class Hours < ActiveRecord::Base
  belongs_to :restaurant, touch: true

  def days
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end
end
