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
					
					if search.results[email] != status
						search.results[email] = status
						search.save!
					end
				end
			end
		end
	end


end
