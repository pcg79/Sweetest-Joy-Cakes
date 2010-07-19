class CakesController < ApplicationController

  PicsPerRow = 6

  # Create methods that behave like:
  # def birthdays
  #   category = Category.find_by_name "Birthdays"
  #   @cakes = category.cakes
  #   render :action => "index"
  # end
  # Category.all.each do |category|
  #   method_name = (category.name.downcase).to_sym
  #   send :define_method, method_name do
  #     @cakes = category.cakes
  #     render :action => "index"
  #   end
  # end

  def show
    @cake = Cake.find params[:id]
    cake_pictures = @cake.cake_pictures
    render_pictures cake_pictures, @cake.name.titleize
  end

  private

  def render_pictures(pictures, title)
    @pictures = pictures / PicsPerRow
    @title = title
  end
end