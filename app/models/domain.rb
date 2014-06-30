class Domain < ActiveRecord::Base
	has_many :configurations, dependent: :destroy
	has_many :email_formats, through: :configurations

	validates :name, presence: true, 
				  	 uniqueness: { case_sensitive: false } 
					

	def self.search(search)
		where('name LIKE ?', "%#{search}%")
	end


end
