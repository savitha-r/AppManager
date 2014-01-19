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

	def invite_by_email
		@app = App.find_by_id(params[:app_id])
		@version = Version.find_by_id(params[:version_id])
		binding.pry
		emails = params[:emails].split(',')
		emails.each do |mail|
			if is_valid_email?(mail)
				AppManagerMailer.invite_app_email(@version.app,@version, mail).deliver
			else
				flash[:notice] = "#{mail} is not a valid email. Please correct it and try again."
				break
			end
		end
		redirect_to developer_company_app_path(@app.company, @app)
	end

	private
	def version_parameters
		params.require(:version).permit(:number,:photo,:device_type)
	end

end
