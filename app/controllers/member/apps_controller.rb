class Member::AppsController < Member::MembersController

	def show
		@app = get_entity App.find_by_id(params[:id])
		@company = @app.company
	end
	
end
