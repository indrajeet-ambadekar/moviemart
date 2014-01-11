class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	validates_presence_of :review_text
end
