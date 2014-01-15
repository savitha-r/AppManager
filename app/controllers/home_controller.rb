class HomeController < ApplicationController

	def index
		if signed_in?
			if current_user.is_super_admin?
      			redirect_to super_admin_home_path
      		else
      			redirect_to dashboard_path
      		end
      	end
	end

	def dashboard
	end
end
