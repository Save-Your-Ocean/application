class LocationsController < ApplicationController

  get '/locations/map' do
    @location = Location.find(id=1)
    erb :'/locations/map'
  end

  # GET: /locations
  get "/locations/all.json" do
    content_type :json
    @locations = Location.all
    @locations.to_json
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

  get "/locations/pending" do
    settings.page_title = 'Pending'
    @user = current_user
    @locations = Location.where(approved: nil)
    if !logged_in?
      redirect to '/users/login'
    else
      erb :'/locations/pending'
    end
  end

  # GET: /locations/5
  get "/locations/:id" do
    @user = current_user
    @location = Location.find(params[:id])
    @checkins = CheckIn.where(location_id: @location.id)
    @user_checkin = CheckIn.where(user_id: @user.id, location_id: params[:id])

    erb :'/locations/show'
  end

  post "/locations/:id" do
    @user = current_user
    checkin = params[:checkin]
    @location = Location.find(params[:id])
    @checkins = CheckIn.where(location_id: @location.id)
    @user_checkin = CheckIn.where(user_id: @user.id, location_id: params[:id])
    @checkin = CheckIn.find_or_create_by(user_id: @user.id, location_id: params[:id])
    if checkin == "true" and @checkin.count == nil
      @checkin.count = 1
      @checkin.save
      flash[:success] = "You have successfully checked in to #{@location.name}! This is your first check-in at this location! Keep coming back!"
      erb :'/locations/show'
    elsif checkin == "true" and @checkin.count > 0
      @checkin.count = @checkin.count + 1
      @checkin.save
      flash[:success] = "You have successfully checked in to #{@location.name}! You have saved <strong>#{@checkin.count}</strong> plastic bottles! "
      erb :'/locations/show'
    else
      
      erb :'/locations/show'
    end
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
