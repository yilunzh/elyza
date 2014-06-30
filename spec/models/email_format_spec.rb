require 'rails_helper'

describe EmailFormat do

	let(:email_format) { FactoryGirl.create(:email_format) }

	subject { email_format }

	it { should respond_to(:format) } 
end
