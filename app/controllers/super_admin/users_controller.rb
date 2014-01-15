class SuperAdmin::UsersController < SuperAdmin::SuperAdminController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_parameters)
		if @user.save
			redirect_to super_admin_user_path(@user)
		else
			render "new"
		end
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def destroy
		@user = User.find_by_id(params[:id])
		@user.destroy
	end


	private

	def user_parameters
		params.require(:user).permit(:name, :password, :password_confirmation, :email)
	end

end
