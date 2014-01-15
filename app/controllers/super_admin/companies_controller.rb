class SuperAdmin::CompaniesController < SuperAdmin::SuperAdminController

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		binding.pry
		@company = Company.create(company_parameters)
		if @company.save
			redirect_to super_admin_company_path(@company)
		else
			render "new"
		end
	end

	def show
		@company = Company.find_by_id(params[:id])
	end

	def destroy
		@company = Company.find_by_id(params[:id])
		@company.destroy
	end


	private

	def company_parameters
		params.require(:company).permit(:name, :address, :phone, :max_admin, :is_active)
	end

end
