class Cake < ActiveRecord::Base
  has_many :cake_pictures
  belongs_to :category
end
