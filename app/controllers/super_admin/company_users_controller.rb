class SuperAdmin::CompanyUsersController < SuperAdmin::SuperAdminController

	def index
		@company = get_entity Company.find_by_id(params[:company_id])
		@company_users = get_entity CompanyUser.find_all_by_company_id(@company.id)
	end

	def update
		@c_user = get_entity CompanyUser.find_by_id(params[:company_id])
		@c_user.assign_attributes(company_user_parameters)
		if @c_user.save
			@company = get_entity Company.find_by_id(@c_user.company_id)
			redirect_to super_admin_company_path(@company)
		else
			render "index"
		end
	end

	private
	def company_user_parameters
		params.require(:company_user).permit(:role)
	end

end
