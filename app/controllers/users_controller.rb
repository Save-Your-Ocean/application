class UsersController < App

  get '/users/login' do
    settings.page_title = 'User Login'

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
      flash[:error] = "Double check your login details!"
      erb :"/users/login"
    end
  end

  get '/users/register' do
    settings.page_title = 'User Registration'
    if logged_in?
      erb :'/users/register'
    else
      redirect to '/user/dashboard'
    end
  end

  post '/users/register' do
    if params[:username] == "" || params[:password] != params[:password_confirmation]
      flash[:error] = "Make sure you have entered a username and your password twice!"
      erb :'/users/register'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/users/dashboard'
    end
  end

  get "/users/profile/:username" do
    settings.page_title = "#{params[:username].capitalize}'s Profile"
    @user = User.find_by(username: params[:username])
    @checkins = CheckIn.where(user_id: @user.id)
    @user_comments = Comment.where(:user_id => @user.id).paginate(:page => params[:page]).order('id DESC')
    erb :'/users/show'
  end

  get '/users/dashboard' do
    settings.page_title = "User Dashboard"
    @user = current_user
    @managed_locations = current_user.managed_locations.paginate(:page => params[:page]).order('id DESC')
    @checkins = CheckIn.where(user_id: 1)
    if logged_in?
      erb :'/users/dashboard'
    else
      redirect to '/users/login'
    end
  end
  
  # GET: /users
  get "/users/all" do
    # matches "GET /users/all?offset=foo&limit=bar"
    content_type :json
    offset = params['offset'].to_i - 1
    limit = params['limit'].to_i - 1
    @users = User.all
    @users[offset..limit].to_json(except: [:password_digest, :role_id])
  end

  # POST: /users
  post "/users" do
    
  end

  # GET: /users/5
  get "/users/:username" do
    content_type :json
    @users = User.find_by(username: params[:username])
    @users.to_json
  end

  # GET: /users/5/edit
  get "/users/:username/edit" do
    settings.page_title = "Edit Profile"
    if current_user.username == params[:username]
      @user = current_user
      erb :"/users/edit"
    else
      flash[:error] = "Sorry, you are not the correct user."
      erb :"/users/dashboard"
    end
  end

  # PATCH: /users/5
  patch "/users/:username/edit" do
    params.delete_if {|key, value| key == "_method" } 
    current_user.update(params)
    @managed_locations = current_user.managed_locations.paginate(:page => params[:page]).order('id DESC')
    flash[:success] = "Your user profile has been updated successfully!"
    erb :"/users/dashboard"

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
