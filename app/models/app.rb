class App < ActiveRecord::Base
	has_many :versions
	has_many :appcompanyusers
	has_many :companyusers, :through => :appcompanyusers
	belongs_to :company

	validates_presence_of :name
end
