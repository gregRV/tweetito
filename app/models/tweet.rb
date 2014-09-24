class Tweet < ActiveRecord::Base
	belongs_to :user
	has_many :retweets

	validates :body, presence: true, length: { maximum: 140, message: "Must be less than 140 chars" }
end