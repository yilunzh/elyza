class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :search

	validates :user, presence: true
	validates :search, presence: true
end
