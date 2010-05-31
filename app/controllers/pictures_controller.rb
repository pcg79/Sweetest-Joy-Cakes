class PicturesController < ApplicationController
  before_filter :authorize, :only => [:create, :new]

  PicsPerRow = 6

  def new
    @joys_sk = "ethan"
  end

  def create
    @picture = Picture.create( params[:picture] )
  end

  def gallery
    @birthday  = category_image :birthdays
    @wedding   = category_image :weddings
    @other     = category_image :others
    @practice  = category_image :practice
  end

  def birthdays
    render_pictures 'birthdays', 'Birthday Cakes'
  end

  def weddings
    render_pictures 'weddings', 'Wedding Cakes'
  end

  def others
    render_pictures 'other', 'Cakes for Other Special Occasions'
  end

  private

  def render_pictures(category, title=nil)
    @pictures = Picture.by_category(category) / PicsPerRow
    @title = title
    render :action => 'index'
  end

  def authorize
    render :nothing => true, :status => 404 unless !params[:joys_sk].blank? && params[:joys_sk] == "ethan"
  end
end