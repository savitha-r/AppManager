class CompanyUser < ActiveRecord::Base
	belongs_to :company
	belongs_to :user

	has_many :app_company_users
	has_many :apps, :through => :app_company_users

	MEMBER = "member"
	DEVELOPER = "developer"
	ADMIN = "admin"

	validates_presence_of :user_id, :company_id
	validates_inclusion_of :role, :in => [MEMBER, DEVELOPER, ADMIN]

	before_validation :set_defaults

	validate :check_max_admin
	
	def name_with_role
		"#{self.user.name} - #{self.role}"
	end

	def set_defaults
		unless [MEMBER, DEVELOPER, ADMIN].include?self.role
			self.role = MEMBER
		end
	end

	def is_admin?
		self.role == ADMIN
	end

	def is_developer?
		self.role == DEVELOPER
	end

	def check_max_admin
		if self.role == ADMIN
			@company = Company.find_by_id(self.company_id)
			@company_users = CompanyUser.where(:company_id => self.company_id, :role => ADMIN)
			if @company_users.length >= @company.max_admin
				self.errors.add(:role, "Max Admins has already been reached for this company.")
			end
		end
	end
	
	
end
