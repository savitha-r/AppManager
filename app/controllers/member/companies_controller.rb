class Member::CompaniesController < Member::MembersController
	before_filter :check_member_user, :except => [:show]
	before_filter :check_inactive_company, :only => [:new,:create]


	def show
		set_company(get_entity Company.find_by_id(params[:id]))
		@company = current_company
		@user = current_user
		@company_users = CompanyUser.find_all_by_company_id(@company.id)
	end

	def check_inactive_company
		@company_users = CompanyUser.where(:user_id => current_user.id, :role => CompanyUser::ADMIN)
		@company_users.each do |c_user|
			@company = get_entity Company.find_by_id(c_user.company_id)
			unless @company.is_active
				flash[:notice] = "You already have an inactive company waiting for approval. Please wait for its approval before proceeding."
				redirect_to root_path
			end
		end
	end

	
end
