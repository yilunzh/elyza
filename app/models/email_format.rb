class EmailFormat < ActiveRecord::Base
	has_many :configurations, dependent: :destroy
	has_many :domains, through: :configurations
end
