class PicturesController < ApplicationController
  before_filter :authorize, :only => [:create, :new]

  def new
    @joys_sk = "ethan"
  end

  def create
    @picture = Picture.create( params[:picture] )
  end

  private

  def authorize
    render :nothing => true, :status => 404 unless !params[:joys_sk].blank? && params[:joys_sk] == "ethan"
  end
end