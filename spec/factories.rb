FactoryGirl.define do
	factory :domain do
		name 			"abcd.com"
	end

	factory :email_format do
		format 			"(fn)"
	end
	
	factory :user do
		email 					"john.doe@abcd.com"
		password				"password"
	end

	factory :search do
		full_name		"john doe"
		domain_name		"abcd.com"
	end
end