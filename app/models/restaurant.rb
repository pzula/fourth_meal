class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3}
  validates :status, presence: true
  validates :url_slug, presence: true, format: {with: /[A-Za-z0-9\-]+/, message: "Only use letters, numbers and -"}, uniqueness: {case_sensitive: false}
  validates :food_type, presence: true
  before_save {|restaurant| restaurant.url_slug.downcase!}
  has_many :items

end
