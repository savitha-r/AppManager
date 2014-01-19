class GlobalmembersController < ApplicationController

	def index
		@company_users = get_entity CompanyUser.find_all_by_user_id(current_user.id)
	end

end
