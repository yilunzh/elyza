class Search < ActiveRecord::Base
	validates :full_name, presence: true
	validates :domain_name, presence: true
end
