class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :email, :username, :password

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(
				password, password_salt)
		end
	end

	def self.authenticate(email,password)
		user = User.find_by_email(email)
		if user && BCrypt::Engine.hash_secret(password, user.password_salt) == user.password_hash
			user 
		else
			nil
		end
	end
end
