class ContentController < ApplicationController

  def index

  end

  def gallery
    @birthday  = category_image :birthdays
    @wedding   = category_image :weddings
    @other     = category_image :others
    @practice  = category_image :practice
  end

  def birthdays
    @pictures = Picture.by_category('birthdays')
    @title = "Birthday Cakes"
    render :action => 'index'
  end

  def weddings
    @pictures = Picture.by_category('weddings')
    @title = "Wedding Cakes"
    render :action => 'index'
  end

  def others
    @pictures = Picture.by_category('other')
    @title = "Cakes for Other Special Occasions"
    render :action => 'index'
  end
end