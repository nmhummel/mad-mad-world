class StarwarsController < ApplicationController

# GET: /stories
  get "/starwars" do
    @starwars = Starwar.all
    erb :"/starwars/index" # get or see all starwars
  end
  # request info to see and display it

  # GET: /starwars/new
  get "/starwars/new" do # get the form to create a new starwar (does not create)
    erb :"/starwars/new" 
  end

  # POST: /starwars
  post "/starwars" do # form is submitted here - CREATES new starwar from form data
    starwar = Starwar.new(params) # not a @var because we're going to redirect and lose this data anyway
    starwar.save 
    redirect "/starwars" # makes a new GET request
  end
  # sending info to server to do something with it

  # GET: /starwars/5
  get "/starwars/:id" do # get one specific starwar
    @starwar = Starwar.find(params["id"])
    erb :"/starwars/show"
  end

  # GET: /starwars/5/edit
  get "/starwars/:id/edit" do # get the form to edit a specific movie...
    @starwar = Starwar.find(params["id"]) # this line of code should be in every route that has :id
    erb :"/starwars/edit"
  end

  # PATCH: /starwars/5
  patch "/starwars/:id" do # ...and update that specific movie using patch/put
    @starwar = Starwar.find(params["id"])
    redirect "/starwars/:id"
  end

  # DELETE: /starwars/5/delete
  delete "/starwars/:id/delete" do # delete a starwar from the database (destroy)
    @starwar = Starwar.find(params["id"])
    redirect "/starwars"
  end
end