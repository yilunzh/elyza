require 'rails_helper'

describe Domain do
	before do
		@domain = Domain.new(name: "google.com")
	end

	subject { @domain }

	it { should respond_to(:name) }
end
