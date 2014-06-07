class Configuration < ActiveRecord::Base
	belongs_to :domain
	belongs_to :email_format

	def self.with_domain_id_and_email_format_id(domain_id, email_format_id)
		Configuration.where("domain_id = ? and email_format_id = ?", "#{domain_id}", "#{email_format_id}")
	end
end
