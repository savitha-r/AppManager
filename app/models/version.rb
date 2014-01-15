class Version < ActiveRecord::Base
	belongs_to :app

	validates_presence_of :number,:type
end
