class Category < ActiveRecord::Base
  has_many :cakes

  def display_pictures
    @display_pictures ||= cakes.map { |cake| cake.display_pictures }.flatten || []
  end

  def display_picture
    display_pictures[rand(display_pictures.length)]
  end
end
