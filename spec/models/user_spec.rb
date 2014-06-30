require 'rails_helper'

describe User do
	before do
		@user = User.new(email: "test@example.com", password: "abcd", password_confirmation: "abcd")
	end

	subject { @user }

	it { should respond_to(:email) }
	it { should respond_to(:encrypted_password) }
	it { should respond_to(:reset_password_token)}
	it { should respond_to(:admin) }
	it { should respond_to(:confirmation_token) }

end
