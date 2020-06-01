class UsersController < ApplicationController

  get '/users/register' do
    settings.page_title = 'User Registration'
    if !logged_in?
      erb :'/users/register', locals: {message: "Please register before you sign in"}
    else
      redirect to '/user/dashboard'
    end
  end

  post '/users/register' do
    if params[:username] == "" || params[:name] == "" || params[:password] == ""
      redirect to '/users/register'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/users/dashboard'
    end
  end

  get '/users/dashboard' do
    settings.page_title = 'Dashboard'
    @user = current_user
    if !logged_in?
      redirect to '/users/login'
    else
      binding.pry
      erb :'/users/dashboard' 
    end
  end

  get '/users/login' do
    settings.page_title = 'User Login'
    @user = current_user
    if logged_in?
      redirect to "/users/dashboard"
    else
      erb :'/users/login'
    end
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect to "/users/dashboard"
    else
      redirect to "/users/register"
    end
  end
  
  # GET: /users
  get "/users" do
    erb :"/users/index"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/logout' do
    settings.page_title = 'Logout'
    session.destroy
    redirect to '/'
  end

end
