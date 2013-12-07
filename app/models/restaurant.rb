class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3}
  validates :status, presence: true
  validates :url_slug, presence: true


end
