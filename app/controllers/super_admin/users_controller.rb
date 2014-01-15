class SuperAdmin::UsersController < SuperAdmin::UsersController

	def index
		@user = User.all
	end

end
