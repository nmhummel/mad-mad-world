class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    # @story = Story.find(params["id"]) - this line of code should be in every route that has :id
    erb :"/users/edit.html"
  end

  # PATCH: /users/5 - update one movie based on the edit form
  patch "/users/:id" do
        # @story = Story.find(params["id"]) - this line of code should be in every route that has :id
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete - destory one item in particular
  delete "/users/:id/delete" do
        # @story = Story.find(params["id"]) - this line of code should be in every route that has :id
    redirect "/users"
  end
end
