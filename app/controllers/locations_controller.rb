class LocationsController < ApplicationController
  get '/locations/map' do
    settings.page_title = 'Refill Stations Map'

    @location = Location.find(id = 1)
    erb :'/locations/map'
  end

  # GET: /locations
  get '/locations/all.json' do
    content_type :json
    @locations = Location.all
    @locations.to_json
  end

  # GET: /locations/new
  get '/locations/new' do
    settings.page_title = 'Add New Location'

    if logged_in?
      erb :"/locations/new"
    else
      redirect to '/users/login'
    end
  end

  # POST: /locations
  post '/locations/new' do
    @user = current_user
    if logged_in?
      @location = Location.create(params)
      LocationManager.create(user_id: @user.id, location_id: @location.id)

      redirect to '/users/dashboard'
    else
      erb :'/errors/login'
    end
  end

  get '/locations/pending' do
    settings.page_title = 'Pending'
    @user = current_user

    if logged_in?
      @manager = LocationManager.all
      @locations = Location.where(approved: nil)

      erb :'/locations/pending'
    else
      redirect to '/users/login'
    end
  end

  post '/locations/pending/:id' do
    settings.page_title = 'Pending Listings'
    @user = current_user

    if logged_in?
      @locations = Location.where(approved: nil)
      approve = params[:approved]
      approval = Location.find(params[:id])
      approval.approved = params[:approved]

      approval.geocode if approval.approved?
      approval.save

      erb :'/locations/pending'
    else
      redirect to '/users/login'
    end
  end

  # GET: /locations/5
  get '/locations/:id' do
    @location = Location.find(params[:id])
    settings.page_title = "#{@location.name.pluralize} Profile"
    @location_comments = @location.comments.paginate(page: params[:page]).order('id DESC')
    if logged_in?
      erb :'/locations/show'
    else
      erb :'/locations/show'
    end

    erb :'/locations/show'
  end

  post '/locations/:id' do
    @user = current_user

    if logged_in?
      checkin = params[:checkin]
      @location = Location.find(params[:id])
      @checkins = CheckIn.where(location_id: @location.id)
      @user_checkin = CheckIn.where(user_id: @current_user.id, location_id: params[:id])
      @checkin = CheckIn.find_or_create_by(user_id: @current_user.id, location_id: params[:id])
      @comment = Comment.create(location_id: @location.id, user_id: @current_user.id, body: params[:body])
      @location_comments = @location.comments.paginate(page: params[:page]).order('id DESC')

      if (checkin == 'true') && @checkin.count.nil?
        @checkin.count = 1
        @checkin.save
        flash[:success] = "You have successfully checked in to #{@location.name}! This is your first check-in at this location! Keep coming back!"
        redirect to '/locations/#{params[:id]}'
      elsif (checkin == 'true') && (@checkin.count > 0)
        @checkin.count = @checkin.count + 1
        @checkin.save
        flash[:success] = "You have successfully checked in to #{@location.name}! You have saved <strong>#{@checkin.count}</strong> plastic bottles! "
        erb :"/locations/show"
      end
    else
      flash[:error] = "Sorry, you must be logged in to do that!"
      redirect to '/users/login'
    end
  end

  # GET: /locations/5/edit
  get '/locations/:id/edit' do
    @location = Location.find(params[:id])
    settings.page_title = "Edit #{@location.name.capitalize}"

    erb :"/locations/edit"
  end

  patch '/locations/:id/edit' do
    params.delete_if { |key, _value| key == '_method' }
    @location = Location.find(params[:id])
    @location.update(params)
    @location.approved = nil
    @location.save
    flash[:success] = 'Your profile has been updated successfully!'
    @managed_locations = current_user.managed_locations.paginate(page: params[:page]).order('id DESC')
    erb :"/users/dashboard"
  end

  # DELETE: /locations/5/delete
  delete '/locations/:id/delete' do
    redirect '/locations'
  end
end
