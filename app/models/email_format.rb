class EmailFormat < ActiveRecord::Base
	has_and_belongs_to_many :domains
end
