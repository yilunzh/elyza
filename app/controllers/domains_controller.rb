require 'pry'

class DomainsController < ApplicationController
	def index
		if params[:search]
			@domains = Domain.search(params[:search])
		else
			@domains = Domain.all
		end
	end

	def new
		@domain = Domain.new
	end

	def create
		@domain = Domain.new(domain_params)

		if @domain.save
			redirect_to domains_path
		else
			render "new"
		end
	end

	def show
		@domain = Domain.find(params[:id])
		@email_formats = @domain.email_formats
	end

	private
		def domain_params
			params.require(:domain).permit(:name)
		end

end
