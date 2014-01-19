class Admin::AppsController < Admin::AdminsController

	def new
		@company = get_entity Company.find_by_id(params[:company_id])
		@company_users = get_entity CompanyUser.find_all_by_company_id(params[:company_id])
		@app = App.new
	end

	def create
		@company = get_entity Company.find_by_id(params[:company_id])
		@app = @company.apps.build(app_parameters)
		if @app.save
			@app.assign_attributes(app_company_parameters)
			if @app.save
				redirect_to admin_company_app_path(@company,@app)
			else
				render "new"
			end
		else
			render "new"
		end
	end

	def show
		@company = get_entity Company.find_by_id(params[:company_id])
		@app = get_entity App.find_by_id(params[:id])
		@host = default_url_options[:host]
	end

	private

	def app_company_parameters
		params.require(:app).permit(:name, :company_user_ids => [])
	end

	def app_parameters
		params.require(:app).permit(:name)
	end

end
