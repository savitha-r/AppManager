class HomeController < ApplicationController

	def index
		if signed_in?
			if current_user.is_super_admin?
      			redirect_to super_admin_home_path
      		else
      			redirect_to dashboard_path
      		end
      	end
	end

	def download
		vid = params[:vid].split('-')
		@version = Version.find_by_id(vid[0])
		if @version.download_id == vid[1]
			redirect_to @version.photo.url
		else
			flash[:notice] = "The link is invalid."
			redirect_to root_path
		end
	end

	def download_email
		vid = params[:vid].split('-')
		@version = Version.find_by_id(vid[1])
		if @version.download_id == vid[2]
			redirect_to @version.photo.url
		else
			flash[:notice] = "The link is invalid."
			redirect_to root_path
		end
	end

end
