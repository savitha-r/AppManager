class Member::AppsController < Member::MembersController

	def show
		@company = Company.find_by_id(params[:company_id])
		@app = App.find_by_id(params[:id])
	end
	
end
