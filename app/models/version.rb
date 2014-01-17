class Version < ActiveRecord::Base
	belongs_to :app

	IOS = "ios"
	ANDROID = "android"

	validates_presence_of :number,:device_type
	validates_inclusion_of :device_type, :in => [IOS, ANDROID]

	has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end
