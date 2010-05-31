class Picture < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "100x100#" }

  named_scope :by_category,  lambda { |*args|
    { :conditions => ["category = ?", args.first], :order => 'photo_file_name ASC' }
  }

end