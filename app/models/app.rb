class App < ActiveRecord::Base
	# no dependency here?
	has_many :versions
	has_many :app_company_users
	has_many :company_users, :through => :app_company_users
	belongs_to :company

	validates_presence_of :name
end
