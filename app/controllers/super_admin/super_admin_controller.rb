class SuperAdmin::SuperAdminController < ApplicationController
	before_filter :check_super_admin_user

	def index
	end

	private

	def check_super_admin_user
		return current_user.is_super_admin?
	end

end
