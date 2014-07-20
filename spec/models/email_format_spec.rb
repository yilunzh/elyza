require 'rails_helper'

describe EmailFormat do

	it "is valid with format" do
		expect(FactoryGirl.build(:email_format)).to be_valid
	end

	it "is invalid without format" do
		expect(FactoryGirl.build(:email_format, format: nil)).to be_invalid
	end

	it "is invalid with duplicate format" do
		FactoryGirl.create(:email_format)
		expect(FactoryGirl.build(:email_format)).to be_invalid
	end
end
