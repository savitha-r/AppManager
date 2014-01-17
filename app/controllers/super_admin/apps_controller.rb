class SuperAdmin::AppsController < SuperAdmin::SuperAdminController

	def new
		@company = Company.find_by_id(params[:company_id])
		@app = App.new
	end

	def create
		@company = Company.find_by_id(params[:company_id])
		@app = @company.apps.build(app_parameters)
		if @app.save
			@app.assign_attributes(app_company_parameters)
			if @app.save
				binding.pry
				redirect_to super_admin_company_app_path(@company,@app)
			else
				render "new"
			end
		else
			render "new"
		end
	end

	def show
		@company = Company.find_by_id(params[:company_id])
		@app = App.find_by_id(params[:id])
	end

	private

	def app_company_parameters
		params.require(:app).permit(:name, :company_user_ids => [])
	end

	def app_parameters
		params.require(:app).permit(:name)
	end

end
