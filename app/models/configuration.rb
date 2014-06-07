class Configuration < ActiveRecord::Base
	belongs_to :domain
	belongs_to :email_format
end
