class UsersController < ApplicationController
# users need to be able to sign up

get "/signup" do
  #shows form to sign up
  erb :"/users/new"
end

post "/signup" do
  #handles signing up the user
  user = User.new(params) #instantiate a user
  # make sure user signs up with valid data
  if 
    params.values.all?{|value| value.blank?} || User.find_by_email(params[:email])
    #user.email.blank? || user.password.blank? || User.find_by_email(params[:email])
    redirect "/signup"
  else
    # log them in
    user.save
    session[:user_id] = user.id # this line of code actually logs us in
    redirect "/starwars"
  end
end

get "/login" do # to show the form
  erb :"/users/login"
end

post "/login" do # process the form
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password]) # if user found and authenticated
    session[:user_id] = user.id
    redirect "/starwars"
  else
    redirect "/login"
  end
end

get "/logout" do
  session.clear
  #session.delete(:user_id) # delete just the user_id
  redirect "/signup"
end

