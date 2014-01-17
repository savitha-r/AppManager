class CompanyUser < ActiveRecord::Base
	belongs_to :company
	belongs_to :user

	has_many :appcompanyusers
	has_many :apps, :through => :appcompanyusers

	validates_presence_of :user_id, :company_id

	before_create :set_defaults

	MEMBER = "member"
	DEVELOPER = "developer"
	ADMIN = "admin"

	def set_defaults
		binding.pry
		self.role = MEMBER
	end

	
	
end
