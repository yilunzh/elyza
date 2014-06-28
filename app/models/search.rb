class Search < ActiveRecord::Base
	belongs_to :user
	belongs_to :status

	store_accessor :results, :format, :email

	validates :full_name, presence: true
	validates :domain_name, presence: true

end
