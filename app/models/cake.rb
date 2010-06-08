class Cake < ActiveRecord::Base
  has_attached_file :photo,
                    :styles => { :medium => "500x500>", :thumb => "100x100#" },
                    :processors => [:rotator]

  scope :by_category,  lambda { |*args| where("category = ?", args.first).order('photo_file_name ASC') }

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

  private

  def set_defaults
    self.rotation ||= 0
  end
end