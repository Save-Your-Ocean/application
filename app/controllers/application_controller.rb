require './config/environment'

class ApplicationController < Sinatra::Base
  register WillPaginate::Sinatra

  configure do
    set :site_name, 'Save Your Ocean'
    set :page_title, 'Save Your Ocean'
    set :public_folder, 'public'
    set :uploads_foler, 'public/uploads'
    set :views, 'app/views'
    set :error_msg, 'Sorry'
    enable :sessions
    set :session_secret, 'sesh'
    use Rack::Flash
  end

  get "/" do
    settings.page_title = "Welcome to Save Your Ocean!"
    @checkins = CheckIn.all
    @locations = Location.all
    @users = User.all
    erb :welcome
  end

  not_found do
    settings.page_title = "404"
    status 404
    erb :'errors/four_oh_four'
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def is_admin?
      current_user.role_id == 1 ? true : false 
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end
end
