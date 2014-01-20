class Member::MembersController < ApplicationController
	before_filter :check_member_user

	include Member::MembersHelper

	def check_member_user
		company_user = CompanyUser.where(:company_id => current_company.id, :user_id => current_user.id, :role => CompanyUser::MEMBER)
		unless company_user.length > 0
			flash[:notice] = "You do not have member access to the #{current_company.name} Company."
			redirect_to root_path
		end
	end
end
