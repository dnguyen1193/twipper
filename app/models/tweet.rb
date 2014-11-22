class Tweet < ActiveRecord::Base
#these properties are the intrinsic values of a Tweet
	belongs_to :user #a tweet belongs to a user
	validates :tweet, length: { maximum: 10 }

end
