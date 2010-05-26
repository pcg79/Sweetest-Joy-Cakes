class ContentController < ApplicationController

  def index

  end

  def gallery_old
    @birthdays = image_list :birthdays
    @weddings  = image_list :weddings
    @other     = image_list :others
    @practice  = image_list :practice
  end

  def gallery
    @birthday  = category_image :birthdays
    @wedding   = category_image :weddings
    @other     = category_image :others
    @practice  = category_image :practice
  end

  def birthdays
    @pictures = image_list :birthdays
    render :action => 'pictures'
  end

  def weddings
    @pictures = image_list :weddings
    render :action => 'pictures'
  end

  def others
    @pictures = image_list :others
    render :action => 'pictures'
  end
end