require 'pry'

class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def show
		@search = Search.find(params[:id])
		@domain = Domain.find_by_name(@search.domain_name)
		@emails = display_emails(@search, @domain)
	end

	def create
		@search = Search.new(search_params)
		if @search.save
			redirect_to search_path(@search)
		else
			render "new"
		end
	end

	private
		def search_params
			params.require(:search).permit(:first_name, :last_name, :domain_name)
		end

		def display_emails(search, domain)
			emails = []
			domain.email_formats.each do |email_format|
				email = email_format.format + "@" + @search.domain_name
				email = email.gsub("(fn)", search.first_name.downcase)
				email = email.gsub("(fnfl)", search.first_name[0].downcase)
				email = email.gsub("(ln)", search.last_name.downcase)
				emails.append(email)
			end
			return emails
		end


end
