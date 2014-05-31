class EmailFormatsController < ApplicationController
	def index
		@email_formats = EmailFormat.all
	end
end
