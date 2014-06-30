require 'rails_helper'

describe Domain do

	let(:domain) { FactoryGirl.create(:domain) }

	subject { domain }

	it { should respond_to(:name) }

	describe "name not present" do
		before do
			domain.name = nil
		end

		it { should_not be_valid }
	end
	
end
