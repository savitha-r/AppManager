class SuperAdmin::CompaniesController < SuperAdmin::SuperAdminController

	def index
		@companies = Company.all
	end

end
