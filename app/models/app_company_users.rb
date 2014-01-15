class AppCompanyUsers < ActiveRecord::Base

	validates_presence_of :app_id, :companyuser_id
end
