require './config/environment'

class ApplicationController < Sinatra::Base

  #@@madlibs = []

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :index 
  end
  
  not_found do
    status 404
    erb :whoopsie
  end

  helpers do 

    def logged_in?
      !!current_user
    end

    def current_user 
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "Please log in to continue."
        redirect "/"
      end
    end
    

  end
  
end
