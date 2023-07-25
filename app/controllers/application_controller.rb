class ApplicationController < ActionController::Base
include ActionController::Cookies
skip_before_action :verify_authenticity_token
# before_action :authenticate_user

# private
# def authenticate_user
# unless user_is_logged_in? || accessing_login_or_signup
#     redirect_to login_path
# end 
# end 

# def user_is_logged_in? 
#     session[:user_id].present?
# end 

# def accessing_login_or_signup 
#     request.path == login_path || request.path == signup_path 
# end
end
