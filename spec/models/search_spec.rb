require 'rails_helper'

describe Search do
	let(:search) { FactoryGirl.create(:search) }

	subject {search}

	it { should respond_to(:full_name) }
	it { should respond_to(:domain_name) }
	it { should respond_to(:status) }
	it { should respond_to(:results) }
end
