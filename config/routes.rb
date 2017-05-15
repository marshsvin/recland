Rails.application.routes.draw do
  # Routes for the Property_review resource:
  # CREATE
  get "/property_reviews/new", :controller => "property_reviews", :action => "new"
  post "/create_property_review", :controller => "property_reviews", :action => "create"

  # READ
  get "/property_reviews", :controller => "property_reviews", :action => "index"
  get "/property_reviews/:id", :controller => "property_reviews", :action => "show"

  # UPDATE
  get "/property_reviews/:id/edit", :controller => "property_reviews", :action => "edit"
  post "/update_property_review/:id", :controller => "property_reviews", :action => "update"

  # DELETE
  get "/delete_property_review/:id", :controller => "property_reviews", :action => "destroy"
  #------------------------------

  # Routes for the Property resource:
  # CREATE
  get "/properties/new", :controller => "properties", :action => "new"
  post "/create_property", :controller => "properties", :action => "create"

  # READ
  get "/properties", :controller => "properties", :action => "index"
  get "/properties/:id", :controller => "properties", :action => "show"

  # UPDATE
  get "/properties/:id/edit", :controller => "properties", :action => "edit"
  post "/update_property/:id", :controller => "properties", :action => "update"

  # DELETE
  get "/delete_property/:id", :controller => "properties", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
