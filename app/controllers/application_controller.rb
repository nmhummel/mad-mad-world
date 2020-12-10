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

# everytime we make a request, a new instance of our appcontroller is instantiated
# @variable gets reset with every call to HTTP
# you could write all code here if you wanted to but it's not clean

# don't access model from the view - use @movies instead of Movie.all in the view files
# in the model, make @movies = Movie.all

# erb has to be a string. sinatra renders things to string in the views

# rack flash can go here and will trickle to the other controllers outside the class
#     inside class there's the method calling use rack-flash