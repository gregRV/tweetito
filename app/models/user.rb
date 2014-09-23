class User < ActiveRecord::Base
	# via StackOverflow
	# In Rails 4, :order has been deprecated and needs to be
	# replaced with lambda scope block. Note that this scope
	# block needs to be passed before any other association
	# options such as dependent: :destroy etc.
	has_many :tweets, -> { order(created_at: :desc) }

	has_many :follows
	has_many :followings, :through => :follows	

	# Adds methods to set and authenticate against a BCrypt password. 
	# This mechanism requires you to have a password_digest attribute.
	# Validations for presence of password on create, confirmation
	# of password (using a password_confirmation attribute) are
	# automatically added
	has_secure_password
end
