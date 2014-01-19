class Member::AppsController < Member::MembersController

	def show
		@company = get_entity Company.find_by_id(params[:company_id])
		@app = get_entity App.find_by_id(params[:id])
	end
	
end
