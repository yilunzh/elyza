FactoryGirl.define do
	factory :domain do
		name 			"abcd.com"
	end

	factory :email_format do
		format 			"(fn)"
	end
	
	factory :user do
		email 			{ Faker::Internet.email }
		password		"password"
	end

	factory :search do
		full_name		"john doe"
		domain_name		"abcd.com"

		after(:build) do |search|
			search.users << FactoryGirl.create(:user)
		end
	end

    factory :request do
    	after(:build) do |request|
    		request.user = FactoryGirl.create(:user)
    		request.search = FactoryGirl.create(:search)
    	end
  	end

  	factory :status do
  		name 			'confirmed'
  	end
end