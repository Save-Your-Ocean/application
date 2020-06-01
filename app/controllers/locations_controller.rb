class LocationsController < ApplicationController

  # GET: /locations
  get "/locations" do
    erb :"/locations/index"
  end

  # GET: /locations/new
  get "/locations/new" do
    erb :"/locations/new"
  end

  # POST: /locations
  post "/locations/new" do
    @user = current_user
    if logged_in?
      @location = Location.create(params)
      LocationManager.create(user_id: @user.id, location_id: @location.id)

      redirect to '/users/dashboard'
    else
      erb :'/errors/login'
    end
  end

  # GET: /locations/5
  get "/locations/:id" do
    erb :"/locations/show"
  end

  # GET: /locations/5/edit
  get "/locations/:id/edit" do
    erb :"/locations/edit"
  end

  # PATCH: /locations/5
  patch "/locations/:id" do
    redirect "/locations/:id"
  end

  # DELETE: /locations/5/delete
  delete "/locations/:id/delete" do
    redirect "/locations"
  end
end
