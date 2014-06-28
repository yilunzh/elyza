class Search < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :statuses

	validates :full_name, presence: true
	validates :domain_name, presence: true

end
