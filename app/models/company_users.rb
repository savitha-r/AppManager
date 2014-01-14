class CompanyUsers < ActiveRecord::Base
	has_many :appcompanyusers
	has_many :apps, :through => :appcompanyusers
end
