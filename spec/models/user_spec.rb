require 'rails_helper'
require 'pry'

describe User do

	let(:user) { FactoryGirl.create(:user) }

	subject { user }

	it { should respond_to(:email) }
	it { should respond_to(:encrypted_password) }
	it { should respond_to(:reset_password_token)}
	it { should respond_to(:admin) }
	it { should respond_to(:confirmation_token) }

	it "is valid with email and password" do
		expect(FactoryGirl.build(:user)).to be_valid
	end
	
	it "is invalid without an email" do
		expect(FactoryGirl.build(:user, email: nil)).to be_invalid
	end
	
	it "is invalid without a password" do 
		expect(FactoryGirl.build(:user, password: nil)).to be_invalid
	end
	
	it "is invalid with a duplicate email" do
		User.create(email: "john.doe@example.com", password: "password")
		expect(User.create(email: "john.doe@example.com", password: "password")).to be_invalid		
	end

	it "is invalid with a password < 8 characters" do
		user = User.new(email: "tester@example.com", password: "abcd")
		expect(user).to be_invalid
	end

end
