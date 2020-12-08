class StoriesController < ApplicationController

# GET: /stories
  get "/stories" do
    @stories = Story.all
    erb :"/stories/index.html" # get or see all stories
  end
  # request info to see and display it

  # GET: /stories/new
  get "/stories/new" do # get the form to create a new story (does not create)
    erb :"/stories/new.html" 
  end

  # POST: /stories
  post "/stories" do # form is submitted here - CREATES new story from form data
    redirect "/stories"
  end
  # sending info to server to do something with it

  # GET: /stories/5
  get "/stories/:id" do # get one specific story
    erb :"/stories/show.html"
  end

  # GET: /stories/5/edit
  get "/stories/:id/edit" do # get the form to edit a specific movie...
    erb :"/stories/edit.html"
  end

  # PATCH: /stories/5
  patch "/stories/:id" do # ...and update that specific movie using patch/put
    redirect "/stories/:id"
  end

  # DELETE: /stories/5/delete
  delete "/stories/:id/delete" do # delete a story from the database (destroy)
    redirect "/stories"
  end
end