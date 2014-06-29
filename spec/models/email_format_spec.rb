require 'rails_helper'

describe EmailFormat do
	before do
		@email_format = EmailFormat.new(format: "(fn)")
	end

	subject { @email_format }

	it { should respond_to(:format) } 
end
