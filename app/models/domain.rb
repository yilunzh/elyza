class Domain < ActiveRecord::Base
	has_many :configurations, dependent: :destroy
	has_many :email_formats, through: :configurations

	def self.search(search)
		where('name LIKE ?', "%#{search}%")
	end


end
