require 'rails_helper'

describe Status do
	before do
		@status = Status.new(name: "probable")
	end

	subject { @status }

	it { should respond_to(:name) }
end
