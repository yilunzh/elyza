require 'rails_helper'

describe Status do
	it "is valid with status" do
		expect(FactoryGirl.build(:status)).to be_valid
	end

	it "is invalid with a blank name" do
		expect(FactoryGirl.build(:status, name: nil)).to be_invalid
	end

	it "is invalid with a duplicate status" do
		FactoryGirl.create(:status)
		expect(FactoryGirl.build(:status)).to be_invalid
	end

end
