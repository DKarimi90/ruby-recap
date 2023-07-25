class SessionsController < ApplicationController
def create 
  user = User.find_by(username: params[:username])
  if user&.authenticate(params[:password])
  session[:user_id] = user.id 
  byebug
  render json: {message: "Successfully Logged in"}
  else 
    render json: {error: "Invalid username or password"}
  end
end 

def destroy
  session.delete :user_id
  render json: {message: "Successfully logged out"}
end
end







  
