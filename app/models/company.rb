class Company < ActiveRecord::Base
	has_many :companyusers
	has_many :users, :through => :companyusers
	has_many :apps

	validates_presence_of :name

	before_create :set_default
end

private

def set_default
	self.is_active = false
	self.max_admin = 2
end
