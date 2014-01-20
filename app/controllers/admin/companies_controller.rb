class Admin::CompaniesController < Admin::AdminsController
	before_filter :check_admin_user, :except => [:show, :new, :create]
	before_filter :check_inactive_company, :only => [:new,:create]
	
	def new
		@company = Company.new
	end

	def create
		# user can keep creating company even after not being approved! this should not be allowed for more than 1 inactive company
		@company = Company.new(company_parameters)
		if @company.save
			@company.assign_attributes(company_user_parameters)
			@company.assign_admin(current_user)
			if @company.save
				redirect_to admin_company_path(@company)
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
			redirect_to admin_company_path(@company)
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

	# partially, the business logic shouldn't be in controller here
	# you can move into business logic area/model and just return true/false so that your logic can be shared across the system
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
