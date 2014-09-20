class User < ActiveRecord::Base
	has_many :tweets

	has_many :follows
	has_many :followings, :through => :follows	

	# Adds methods to set and authenticate against a BCrypt password. 
	# This mechanism requires you to have a password_digest attribute.
	# Validations for presence of password on create, confirmation
	# of password (using a password_confirmation attribute) are
	# automatically added
	has_secure_password
end
