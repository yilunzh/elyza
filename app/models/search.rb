class Search < ActiveRecord::Base
	belongs_to :user
	belongs_to :status

	store_accessor :results, :email, :response

	validates :full_name, presence: true
	validates :domain_name, presence: true

	validate :search_id_uniqueness

	def search_id_uniqueness
		existing_record = Search.where(full_name: full_name.downcase, domain_name: domain_name.downcase).first
		unless existing_record.blank?
			errors.add(:search_id, "has already been saved in this search term combination")
		end
	end

end
