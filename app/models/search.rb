class Search < ActiveRecord::Base
	belongs_to :user

	validates :full_name, presence: true
	validates :domain_name, presence: true
end
