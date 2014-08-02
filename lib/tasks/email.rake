require 'pry'

namespace :email do
	desc "Find inderterminate emails"
	task validate_indeterminate: :environment do
		emails = []
		Search.all.each do |search|
			search.results.each do |email, status|
				if status.to_i/100 == 2
					response = RestClient.get "http://www.email-validator.net/api/verify?EmailAddress=#{email}&APIKey=#{ENV["EMAIL_VALIDATOR_API_KEY"]}" 
					response = JSON.parse response
						
					status = response["status"].to_s
					
					#issue with rails 4.1 and hstore bug, need to wait for rails 4.2 
					#http://stackoverflow.com/questions/20251296/how-can-i-update-a-data-records-value-with-ruby-on-rails-4-0-1-postgresql-hstor
					if search.results[email] != status
						search.results[email] = status
						search.save!
					end
				end
			end
		end
	end


end
