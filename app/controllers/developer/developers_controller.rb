class Developer::DevelopersController < ApplicationController
	before_filter :check_developer_user

	include Developer::DevelopersHelper

	def check_developer_user
		company_user = CompanyUser.where(:company_id => current_company.id, :user_id => current_user.id, :role => CompanyUser::DEVELOPER)
		unless company_user.length > 0
			flash[:notice] = "You do not have developer access to the #{current_company.name} Company."
			redirect_to root_path
		end
	end
	
end
