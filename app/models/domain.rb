class Domain < ActiveRecord::Base
	has_and_belongs_to_many :email_formats

	def self.search(search)
		where('name LIKE ?', "%#{search}%")
	end


end
