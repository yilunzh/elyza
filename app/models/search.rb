class Search < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :domain_name, presence: true
end
