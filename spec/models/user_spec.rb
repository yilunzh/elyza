require 'rails_helper'

describe User do

	# before do
	# 	@user = User.create(email: "test@example.com", password: "abcd", password_confirmation: "abcd")
	# end

	let(:user) { FactoryGirl.create(:user) }

	subject { user }

	it { should respond_to(:email) }
	it { should respond_to(:encrypted_password) }
	it { should respond_to(:reset_password_token)}
	it { should respond_to(:admin) }
	it { should respond_to(:confirmation_token) }

	it "is valid with email and password" do
		user = User.new(email: "tester@example.com", password: "abcdefgh")
		expect(user).to be_valid
	end
	
	it "is invalid without an email" do
		user = User.new(email: nil, password: "abcdefgh")
		expect(user).to be_invalid
	end
	
	it "is invalid without a password" do
		user = User.new(email: "tester@example.com", password: nil)
		expect(user).to be_invalid
	end
	
	it "is invalid with a duplicate email" do
		User.create(email: "tester@example.com", password: "abcdefgh")
		user = User.new(email: "tester@example.com", password: "abcdefgh")
		expect(user).to be_invalid		
	end

	it "is invalid with a password < 8 characters" do
		user = User.new(email: "tester@example.com", password: "abcd")
		expect(user).to be_invalid
	end


end
