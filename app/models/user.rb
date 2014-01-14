class User < ActiveRecord::Base
	has_many :companyusers
	has_many :companies, :through => :companyusers
end
