include Paperclip

class CakePicture < ActiveRecord::Base
  belongs_to :cake

  has_attached_file :photo,
                    :styles => { :large => "500x500>", :medium => "200x200#", :thumb => "100x100#" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :processors => [:rotator]

  scope :by_category,  lambda { |*args| where("category = ?", args.first).order('photo_file_name ASC') }

  scope :display_pictures, where(:display_picture => true)

  attr_accessor :rotation, :rotate

  before_create :set_defaults

  def rotate!(degrees = 90)
    self.rotation += degrees
    self.rotation -= 360 if self.rotation >= 360
    self.rotation += 360 if self.rotation <= -360

    self.rotate = true
    self.photo.reprocess!
    self.save
  end

  def rotating?
    !self.rotation.nil? and self.rotate
  end

  def category
    cake.category if cake
  end

  private

  def set_defaults
    self.rotation ||= 0
  end
end