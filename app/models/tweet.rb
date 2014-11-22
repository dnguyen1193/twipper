class Tweet < ActiveRecord::Base

	belongs_to :user #a tweet belongs to a user
end
