class Developer::CompaniesController < Developer::DevelopersController
	before_filter :check_developer_user, :except => [:show]
	before_filter :check_inactive_company, :only => [:new,:create]

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_parameters)
		if @company.save
			@company.assign_attributes(company_user_parameters)
			if @company.save
				redirect_to developer_company_path(@company)
			else
				render "new"
			end
		else
			render "new"
		end
	end

	def edit
		@company = get_entity Company.find_by_id(params[:id])
	end
		
	def update
		@company = get_entity Company.find_by_id(params[:id])
		@company.assign_attributes(company_user_parameters)
		if @company.save
			redirect_to developer_company_path(@company)
		else
			render "edit"
		end
	end

	def show
		set_company(get_entity Company.find_by_id(params[:id]))
		@company = current_company
		@user = current_user
		@company_users = CompanyUser.find_all_by_company_id(@company.id)
	end

	private

	def company_user_parameters
		params.require(:company).permit(:name, :address, :phone, :max_admin, :is_active, :user_ids => [])
	end


	def company_parameters
		params.require(:company).permit(:name, :address, :phone, :max_admin, :is_active)
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
