class Api::LocationsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @categories = Category.all
    render "locations/index"    
  end
  
  def gmaps
    @locations = Location.all
    render "locations/gmaps"
  end
  
  def show
    @location = Location.find_by_id(params[:id])
    render "locations/show"
  end
  
  def category
    @category = Category.find(params[:id])
    @locations = Location.find_all_by_category_id(params[:id])
    render "locations/category"
  end

end