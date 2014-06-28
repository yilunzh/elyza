class Search < ActiveRecord::Base
	belongs_to :user
	belongs_to :status

	validates :full_name, presence: true
	validates :domain_name, presence: true

end
