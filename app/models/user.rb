require 'bcrypt'

class User < ApplicationRecord

	include BCrypt

	SALT = '3$5aD9y'

	validates :first_name, :last_name, :email, :password_digest, :birth_date, presence: true

	def authenticate(password)
		Password.new(self.password_digest) == salt_password(password) #&& self.email_confirmed
	end

	def password=(password)
		self.password_digest = Password.create(salt_password(password))
	end

	private
	def salt_password(password)
    SALT + password
  end
end
