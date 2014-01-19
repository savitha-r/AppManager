class SuperAdmin::SuperAdminController < ApplicationController
	before_filter :check_super_admin_user

	def index
	end

	private

	def check_super_admin_user
		unless current_user.is_super_admin?
			flash[:notice] = "You do have access to Super Admin methods"
			redirect_to root_path
		end
	end

end
