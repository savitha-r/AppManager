class AppCompanyUser < ActiveRecord::Base

	belongs_to :app
	belongs_to :company_user

	validates_presence_of :app_id, :company_user_id
end
