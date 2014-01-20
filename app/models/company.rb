class Company < ActiveRecord::Base
	has_many :company_users # dependency
	has_many :users, :through => :company_users
	has_many :apps

	validates_presence_of :name

	#this is not right
	before_create :set_default

	def assign_admin(user)
		@company_user = self.company_users.find_by_user_id(user.id)
		if @company_user
			@company_user.role = CompanyUser::ADMIN
			@company_user.save
		end
	end



private

# your model is shared by all controller, whether it's admin/normal user. 
# doing this means you can't initialize what you want in admin
# what you can do
	# def self.initiate_with_default(args)
	# 	temp = Company.new(args)
	# 	temp.is_active = false
	# 	temp.max_admin = 2
	# 	temp
	# end


def set_default
	self.is_active = false
	self.max_admin = 2
end

end
