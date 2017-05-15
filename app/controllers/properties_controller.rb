class PropertiesController < ApplicationController
  before_action :current_user_must_be_property_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_property_user
    property = Property.find(params[:id])

    unless current_user == property.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @properties = Property.all
    @location_hash = Gmaps4rails.build_markers(@properties.where.not(:address_latitude => nil)) do |property, marker|
      marker.lat property.address_latitude
      marker.lng property.address_longitude
      marker.infowindow "<h5><a href='/properties/#{property.id}'>#{property.user_id}</a></h5><small>#{property.address_formatted_address}</small>"
    end

    render("properties/index.html.erb")
  end

  def show
    @request = Request.new
    @property_review = PropertyReview.new
    @picture = Picture.new
    @property = Property.find(params[:id])

    render("properties/show.html.erb")
  end

  def new
    @property = Property.new

    render("properties/new.html.erb")
  end

  def create
    @property = Property.new

    @property.user_id = params[:user_id]
    @property.address = params[:address]
    @property.zip_code = params[:zip_code]
    @property.state = params[:state]
    @property.city = params[:city]
    @property.acreage = params[:acreage]
    @property.description = params[:description]
    @property.price = params[:price]

    save_status = @property.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/properties/new", "/create_property"
        redirect_to("/properties")
      else
        redirect_back(:fallback_location => "/", :notice => "Property created successfully.")
      end
    else
      render("properties/new.html.erb")
    end
  end

  def edit
    @property = Property.find(params[:id])

    render("properties/edit.html.erb")
  end

  def update
    @property = Property.find(params[:id])
    @property.address = params[:address]
    @property.zip_code = params[:zip_code]
    @property.state = params[:state]
    @property.city = params[:city]
    @property.acreage = params[:acreage]
    @property.description = params[:description]
    @property.price = params[:price]

    save_status = @property.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/properties/#{@property.id}/edit", "/update_property"
        redirect_to("/properties/#{@property.id}", :notice => "Property updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Property updated successfully.")
      end
    else
      render("properties/edit.html.erb")
    end
  end

  def destroy
    @property = Property.find(params[:id])

    @property.destroy

    if URI(request.referer).path == "/properties/#{@property.id}"
      redirect_to("/", :notice => "Property deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Property deleted.")
    end
  end
end
