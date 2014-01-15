class CompanyUsers < ActiveRecord::Base
	has_many :appcompanyusers
	has_many :apps, :through => :appcompanyusers

	validates_presence_of :user_id, :company_id
	
end
