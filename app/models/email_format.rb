class EmailFormat < ActiveRecord::Base
	has_many :configurations
	has_many :domains, through: :configurations
end
