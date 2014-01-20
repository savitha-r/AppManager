class GlobalmembersController < ApplicationController

	def index
		@company_users = CompanyUser.find_all_by_user_id(current_user.id)
	end

end
