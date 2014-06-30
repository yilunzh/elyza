require 'rails_helper'

describe Domain do
	before do
		@domain = Domain.new(name: "google.com")
	end

	subject { @domain }

	it { should respond_to(:name) }

	describe "name not present" do
		before do
			@domain.name = nil
		end

		it { should_not be_valid }
	end
	
end
