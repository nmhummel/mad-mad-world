require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index # this renders the file
  end

end

# everytime we make a request, a new instance of our appcontroller is instantiated
# @variable gets reset with every call to HTTP
# you could write all code here if you wanted to but it's not clean

# don't access model from the view - use @movies instead of Movie.all in the view files
# in the model, make @movies = Movie.all

# erb has to be a string. sinatra renders things to string in the views
