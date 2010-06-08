class CakesController < ApplicationController
  before_filter :authorize, :only => [:create, :new]

  PicsPerRow = 6

  def new
    @joys_sk = "ethan"
  end

  def create
    @picture = Picture.create params[:picture]
  end

  def gallery
    @birthday = category_image :birthdays
    @wedding  = category_image :weddings
    @other    = category_image :others
    @practice = category_image :practice
  end

  def birthdays
    render_pictures 'Birthday Cakes', 'birthdays',
  end

  def weddings
    render_pictures 'Wedding Cakes', 'weddings'
  end

  def others
    render_pictures 'Cakes for Other Special Occasions', 'other', 'practice'
  end

  private

  def render_pictures(title, *categories)
    @pictures = Cake.order('photo_file_name ASC')
    categories.each do |category|
      @pictures.where('category = ', category)
    end
    @pictures = @pictures / PicsPerRow
    @title = title
    render :action => 'index'
  end

  def authorize
    render :nothing => true, :status => 404 unless !params[:joys_sk].blank? && params[:joys_sk] == "ethan"
  end
end