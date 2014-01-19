class Admin::CompaniesController < Admin::AdminsController

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_parameters)
		if @company.save
			@company.assign_attributes(company_user_parameters)
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
		@company = Company.find_by_id(params[:id])
	end
		
	def update
		binding.pry
		@company = Company.find_by_id(params[:id])
		@company.assign_attributes(company_user_parameters)
		if @company.save
			redirect_to admin_company_path(@company)
		else
			render "edit"
		end
	end

	def show
		set_company(Company.find_by_id(params[:id]))
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

end
