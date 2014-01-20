class Version < ActiveRecord::Base
	belongs_to :app

	# same like company_user
	IOS = "ios"
	ANDROID = "android"

	validates_presence_of :number,:device_type
	validates_inclusion_of :device_type, :in => [IOS, ANDROID]

	# why photo????????????????
	# isn't it supposed to be binary file?
	has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

    after_create :assign_download_id

     def assign_download_id
		self.download_id = SecureRandom.hex(2)
		self.save
	 end

# you don't need this. you can sign a link with master key with/without timestamp
	 def direct_download_link
	 	self.id.to_s + '-' + self.download_id
	 end

	 def email_download_link
	 	'email-' + self.direct_download_link
	 end
end
