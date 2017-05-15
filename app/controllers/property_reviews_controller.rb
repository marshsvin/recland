class PropertyReviewsController < ApplicationController
  before_action :current_user_must_be_property_review_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_property_review_user
    property_review = PropertyReview.find(params[:id])

    unless current_user == property_review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @property_reviews = PropertyReview.page(params[:page]).per(10)

    render("property_reviews/index.html.erb")
  end

  def show
    @property_review = PropertyReview.find(params[:id])

    render("property_reviews/show.html.erb")
  end

  def new
    @property_review = PropertyReview.new

    render("property_reviews/new.html.erb")
  end

  def create
    @property_review = PropertyReview.new

    @property_review.content = params[:content]
    @property_review.property_id = params[:property_id]
    @property_review.user_id = params[:user_id]

    save_status = @property_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_reviews/new", "/create_property_review"
        redirect_to("/property_reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Property review created successfully.")
      end
    else
      render("property_reviews/new.html.erb")
    end
  end

  def edit
    @property_review = PropertyReview.find(params[:id])

    render("property_reviews/edit.html.erb")
  end

  def update
    @property_review = PropertyReview.find(params[:id])

    @property_review.content = params[:content]
    @property_review.property_id = params[:property_id]
    @property_review.user_id = params[:user_id]

    save_status = @property_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_reviews/#{@property_review.id}/edit", "/update_property_review"
        redirect_to("/property_reviews/#{@property_review.id}", :notice => "Property review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Property review updated successfully.")
      end
    else
      render("property_reviews/edit.html.erb")
    end
  end

  def destroy
    @property_review = PropertyReview.find(params[:id])

    @property_review.destroy

    if URI(request.referer).path == "/property_reviews/#{@property_review.id}"
      redirect_to("/", :notice => "Property review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Property review deleted.")
    end
  end
end
