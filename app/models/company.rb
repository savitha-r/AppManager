class Company < ActiveRecord::Base
	has_many :company_users
	has_many :users, :through => :company_users
	has_many :apps

	validates_presence_of :name

	before_create :set_default

	def assign_admin(user)
		@company_user = self.company_users.find_by_user_id(user.id)
		if @company_user
			@company_user.role = "admin"
			@company_user.save
		end
	end



private

def set_default
	self.is_active = false
	self.max_admin = 2
end

end
