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
    erb :index # this renders the file
  end

  helpers do # allows our views to access the methods - only shareable in views

    def logged_in?
      !!current_user
    end

    def current_user # memoization
      @current_user ||= User.find(session[:user_id]) if session[:user_id] # if they're not even logged in don't bother
    end

  end

  private

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:message] = "Wrong username or password. Please try again."
      redirect "/login" #leaved the method if not logged in
     end
  end
  
end
