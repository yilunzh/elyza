require 'rails_helper'
require 'pry'

describe Request do

	before :each do
		@request = FactoryGirl.build(:request)
	end

	it "is valid with user_id and search_id" do
		expect(@request).to be_valid
	end

	it "is invalid without user_id" do
		@request.user = nil
		expect(@request).to be_invalid
	end

	it "is invalid without search_id" do
		@request.search = nil
		expect(@request).to be_invalid
	end

end
