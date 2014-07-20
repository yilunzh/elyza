require 'rails_helper'

describe Domain do

	it "is valid with domain name" do
		expect(FactoryGirl.build(:domain)).to be_valid
	end

	it "is invalid with bland domain name" do
		expect(FactoryGirl.build(:domain, name: nil)). to be_invalid
	end

	it "is invalid with duplicate domain name" do
		FactoryGirl.create(:domain)
		expect(FactoryGirl.build(:domain)).to be_invalid
	end

end
