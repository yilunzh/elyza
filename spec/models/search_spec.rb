require 'rails_helper'

describe Search do
	let(:search) { FactoryGirl.create(:search) }

	subject {search}

	it { should respond_to(:full_name) }
	it { should respond_to(:domain_name) }
	it { should respond_to(:status) }
	it { should respond_to(:results) }

	it "has valid factory" do
		expect(FactoryGirl.build(:search)).to be_valid
	end

	it "is invalid with blank name" do
		expect(FactoryGirl.build(:search, full_name: nil)).to be_invalid
	end

	it "is invalid with blank domain name" do
		expect(FactoryGirl.build(:search, domain_name: nil)).to be_invalid
	end

	it "is invalid with duplicate name and domain name combo" do
		FactoryGirl.create(:search)
		expect(FactoryGirl.build(:search)).to be_invalid
	end

	it "is invalid with duplicate name and domain name combo case insensitive " do
		FactoryGirl.create(:search)
		expect(FactoryGirl.build(:search)).to be_invalid
	end

	it "is invalid without a user" do
		expect(Search.create(full_name: "John Doe", domain_name: "abcd.com")).to be_invalid
	end
end
