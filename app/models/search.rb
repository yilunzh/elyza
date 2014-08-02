class Search < ActiveRecord::Base

	has_many :requests
	has_many :users, through: :requests
	belongs_to :status

	store_accessor :results, :email, :response

	validates :full_name, presence: true
	validates :domain_name, presence: true
	validates :users, presence: true

	validate :search_id_uniqueness, uniqueness: { case_sensitive: false }

	def search_id_uniqueness
		existing_record = Search.where(full_name: full_name, domain_name: domain_name).first
		unless existing_record.blank?
			errors.add(:search_id, "has already been saved in this search term combination")
		end
	end
end
