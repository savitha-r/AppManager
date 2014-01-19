class Developer::VersionsController < Developer::DevelopersController

	def new
		@app = App.find_by_id(params[:app_id])
		@version = Version.new
	end

	def create
		@app = App.find_by_id(params[:app_id])
		@version = @app.versions.build(version_parameters)
		if @version.save
			redirect_to developer_company_app_path(@app.company, @app)
		else
			render "new"
		end
	end

	private
	def version_parameters
		params.require(:version).permit(:number,:photo,:device_type)
	end

end
