class SessionsController < ApplicationController

  def create
  	user = User.find_by_email(params[:email])
  	if user.authenticate(params[:password])
      sign_in user
      if user.is_super_admin?
      	redirect_to super_admin_home_path
      else
      	redirect_to dashboard_path
      end
  	else
  		flash[:notice] = "Authentication Failure. Please try again."
  		redirect_to root_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
