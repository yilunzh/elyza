require 'pry'

class DomainsController < ApplicationController
	def index
		if params[:search]
			@domains = Domain.search(params[:search])
		else
			@domains = Domain.all
		end
	end

	def show
		@domain = Domain.find(params[:id])
		@email_formats = @domain.email_formats
	end

end
