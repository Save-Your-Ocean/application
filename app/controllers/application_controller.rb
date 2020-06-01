require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :site_name, 'Save Your Ocean'
    set :public_folder, 'public'
    set :views, 'app/views'
    set :error_msg, 'Sorry'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get "/" do
    @page_title = "Welcome"
    erb :welcome
  end

  not_found do
    @page_title = "404"
    status 404
    erb :'errors/four_oh_four'
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

  end
end
