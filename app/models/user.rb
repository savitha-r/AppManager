class User < ActiveRecord::Base
	has_many :company_users
	has_many :companies, :through => :company_users

	has_secure_password


	validates_presence_of :name, :password_digest, :email
	# where is email validation format?
	validates_uniqueness_of :email

	before_create :create_remember_token


	def is_super_admin?
		self.is_super_admin == true
	end


	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
