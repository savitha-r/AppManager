class Member::CompaniesController < Member::MembersController


	def show
		set_company(Company.find_by_id(params[:id]))
		@company = current_company
		@user = current_user
		@company_users = CompanyUser.find_all_by_company_id(@company.id)
	end

	
end
