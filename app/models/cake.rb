class Cake < ActiveRecord::Base
  has_many :cake_pictures
  belongs_to :category

  def display_pictures
    unless @display_pictures
      @display_pictures = cake_pictures.display_pictures.blank? ? cake_pictures : cake_pictures.display_pictures
    end

    @display_pictures
  end

  def display_picture
    pictures = display_pictures
    pictures[rand(pictures.length)]
  end
end
