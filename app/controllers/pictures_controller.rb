class PicturesController < ApplicationController
  def index
    @q = Picture.ransack(params[:q])
    @pictures = @q.result(:distinct => true).includes(:property).page(params[:page]).per(10)

    render("pictures/index.html.erb")
  end

  def show
    @picture = Picture.find(params[:id])

    render("pictures/show.html.erb")
  end

  def new
    @picture = Picture.new

    render("pictures/new.html.erb")
  end

  def create
    @picture = Picture.new

    @picture.image = params[:image]
    @picture.property_id = params[:property_id]

    save_status = @picture.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pictures/new", "/create_picture"
        redirect_to("/pictures")
      else
        redirect_back(:fallback_location => "/", :notice => "Picture created successfully.")
      end
    else
      render("pictures/new.html.erb")
    end
  end

  def edit
    @picture = Picture.find(params[:id])

    render("pictures/edit.html.erb")
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.image = params[:image]
    @picture.property_id = params[:property_id]

    save_status = @picture.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pictures/#{@picture.id}/edit", "/update_picture"
        redirect_to("/pictures/#{@picture.id}", :notice => "Picture updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Picture updated successfully.")
      end
    else
      render("pictures/edit.html.erb")
    end
  end

  def destroy
    @picture = Picture.find(params[:id])

    @picture.destroy

    if URI(request.referer).path == "/pictures/#{@picture.id}"
      redirect_to("/", :notice => "Picture deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Picture deleted.")
    end
  end
end
