class User < ActiveRecord::Base
	has_many :companyusers
	has_many :companies, :through => :companyusers

	has_secure_password

	validates_presence_of :name, :password_digest, :email
	validates_uniqueness_of :email

	before_create :create_remember_token


	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
