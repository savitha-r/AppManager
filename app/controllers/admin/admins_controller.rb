class Admin::AdminsController < ApplicationController
	include Admin::AdminsHelper
	before_filter :check_admin_user

	def check_admin_user
		company_user = CompanyUser.where(:company_id => current_company.id, :user_id => current_user.id, :role => "admin")
		unless company_user.length > 0
			flash[:notice] = "You do have admin access to the #{current_company.name} Company."
			redirect_to root_path
		end
	end

end
