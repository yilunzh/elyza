require 'rails_helper'

describe Configuration do
	before do
		@configuration = Configuration.new(score: 0)
	end
	
	subject { @configuration }

	it { should respond_to(:domain) }
	it { should respond_to(:email_format) }
	it { should respond_to(:score) }
end

