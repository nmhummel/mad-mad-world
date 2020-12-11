class StarwarsController < ApplicationController

  get "/starwars" do 
    redirect_if_not_logged_in
    @starwars = Starwar.all
    erb :"/starwars/index" 
  end
  
  get "/starwars/new" do 
    redirect_if_not_logged_in
    erb :"/starwars/new" 
  end

  post "/starwars" do 
    starwar = Starwar.new(params)
    starwar.fill_in_the_blanks
    starwar.user_id = session[:user_id] 
    starwar.save 
    flash[:message] = "Story saved!"
    redirect "/starwars/#{starwar.id}" 
  end
  
  get "/starwars/:id" do 
    redirect_if_not_logged_in
    @starwar = Starwar.find(params[:id]) 
    erb :"/starwars/show"
  end

  get "/starwars/:id/edit" do 
    redirect_if_not_logged_in
    @starwar = Starwar.find(params["id"]) 
    redirect_if_not_authorized 
    erb :"/starwars/edit"
  end

  patch "/starwars/:id" do 
    @starwar = Starwar.find(params["id"])
    redirect_if_not_authorized 
    @starwar.update(params["starwars"])
    @starwar.fill_in_the_blanks
    @starwar.save
    flash[:message] = "Edit successful."
    redirect "/starwars/#{@starwar.id}"
  end

  delete "/starwars/:id" do
    redirect_if_not_logged_in 
    @starwar = Starwar.find(params["id"])
    redirect_if_not_authorized
    @starwar.destroy
    flash[:message] = "Story deleted."
    redirect "/users"
  end

  private

  def redirect_if_not_authorized
    if @starwar.user_id != session[:user_id]
      flash[:message] = "Sorry-- you can't do that."
      redirect "/starwars"  
    end
  end

end