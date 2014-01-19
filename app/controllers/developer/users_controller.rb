class Developer::UsersController < Developer::DevelopersController

	def new
		@company = get_entity Company.find_by_id(params[:company_id])
		@user = User.new
	end

	def create
		@company = get_entity Company.find_by_id(params[:company_id])
		@user = User.new(user_parameters)
		if @user.save
			@user.companies.push(@company)
			if @user.save
				redirect_to developer_company_user_path(@company,@user)
			else
				render "new"
			end
		else
			render "new"
		end
	end

	def show
		@company = get_entity Company.find_by_id(params[:company_id])
		@user = get_entity User.find_by_id(params[:id])
	end

	private

	def user_parameters
		params.require(:user).permit(:name, :password, :password_confirmation, :email)
	end

end
