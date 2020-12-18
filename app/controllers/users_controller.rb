class UsersController < ApplicationController

  get "/users" do
    redirect_if_not_logged_in
    @starwars = current_user.starwars
    erb :"/users/index"
  end

  get "/signup" do
    erb :"/users/new"
  end

  post "/signup" do
    user = User.new(params) 
    if !user.save
      flash[:message] = user.errors.full_messages.join(" // ")
      redirect "/signup"
    else
      user.save # comment out - double saving
      flash[:message] = "Signup successful. Please login now."
      session[:user_id] = user.id 
      redirect "/users"
    end
  end

  get "/login" do 
    redirect_if_not_logged_in
    @starwars = Starwar.all # get rid of!
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      flash[:message] = "Log in successful."
      redirect "/users"
    else
      flash[:message] = "Please check your info and try again."
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    flash[:message] = "Logout successful."
    redirect "/"
  end

  delete '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    if @user == current_user
      @user.destroy
      session.clear 
      flash[:message] = "Account and stories deleted."
      redirect "/"
    else
      flash[:message] = "Not authorized."
      redirect "/users" 
    end
  end 

end
