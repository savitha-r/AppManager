class CompanyUser < ActiveRecord::Base
	belongs_to :company
	belongs_to :user

	has_many :appcompanyusers
	has_many :apps, :through => :appcompanyusers

	MEMBER = "member"
	DEVELOPER = "developer"
	ADMIN = "admin"

	validates_presence_of :user_id, :company_id
	validates_inclusion_of :role, :in => [MEMBER, DEVELOPER, ADMIN]

	before_validation :set_defaults
	
	

	def set_defaults
		unless [MEMBER, DEVELOPER, ADMIN].include?self.role
			self.role = MEMBER
		end
	end

	
	
end
