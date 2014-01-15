class SessionsController < ApplicationController

  def create
  	if user.authenticate?
      sign_in user
  	else
  		redirect_to root_path
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
