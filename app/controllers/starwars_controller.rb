class StarwarsController < ApplicationController

# GET: /stories - get or see all starwars
  get "/starwars" do
    @starwars = Starwar.all
    erb :"/starwars/index" 
  end
  # request info to see and display it

  # GET: /starwars/new - get the form to create a new starwar (does not create)
  get "/starwars/new" do 
    redirect_if_not_logged_in
    erb :"/starwars/new" 
  end

  # POST: /starwars - form is submitted here - CREATES new starwar from form data
  post "/starwars" do 
    redirect_if_not_logged_in
    starwar = Starwar.new(params)
    starwar.user_id = session[:user_id]
    # not a @var because we're going to redirect and lose this data anyway
    starwar.save 
    #@@madlibs << starwar
    redirect "/starwars/#{starwar.id}" 
    # makes a new GET request - sending info to server to do something with it
  end
  

  # GET: /starwars/5 - get one specific starwar
  get "/starwars/:id" do 
    @starwar = Starwar.find(params[:id]) #or "id"
    #@starwar.update(title: params["starwar"]["title"])
    erb :"/starwars/show"
  end

  # GET: /starwars/5/edit - get the form to edit a specific movie...
  get "/starwars/:id/edit" do 
    @starwar = Starwar.find(params["id"]) 
    # the above line of code should be in every route that has :id
    redirect_if_invalid 
    end
    erb :"/starwars/edit"
  end

  # PATCH: /starwars/5 - ...and update that specific movie using patch/put
  patch "/starwars/:id" do # put/patch
    redirect_if_not_logged_in
    @starwar = Starwar.find(params["id"])
    redirect_if_invalid
    #@starwar.update[title:]
    #@starwar.update(title: params["starwar"]["title"])
    @movie.update(params["movie"])
    redirect "/starwars/#{@movie.id}"
  end

  # DELETE: /starwars/5/delete - destroy a starwar from the database
  delete "/starwars/:id/" do 
    @starwar = Starwar.find(params["id"])
    redirect_if_invalid
    @starwar.destroy
    #show success message
    redirect "/starwars"
  end

  private
  def redirect_if_invalid
    if @movie.user_id != session[:user_id]
      redirect:"/starwars"  
    end
  end

end