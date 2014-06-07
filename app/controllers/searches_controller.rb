require 'pry'

class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def show
		@search = Search.find(params[:id])
		@new_search = Search.new
		@new_search.assign_attributes(first_name: @search.first_name, 
									  last_name: @search.last_name, 
									  domain_name: @search.domain_name)
		@domain = Domain.find_by_name(@search.domain_name)
		@emails = display_emails(@search, @domain)
	end

	def create
		@search = Search.new(search_params)
		if @search.save
			if Domain.find_by_name(search_params[:domain_name])
				redirect_to search_path(@search)
			else
				binding.pry
				@domain = Domain.new(name: search_params[:domain_name])
				associate_email_formats_with_domain(@domain)
				if @domain.save
					redirect_to search_path(@search)
				else
					render "new"
				end
			end
		else
			render "new"
		end
	end

	private
		def search_params
			params.require(:search).permit(:first_name, :last_name, :domain_name)
		end

		def convert_email_format(email_format)
			email = email_format.format + "@" + @search.domain_name
			email = email.gsub("(fn)", @search.first_name.downcase)
			email = email.gsub("(fnfl)", @search.first_name[0].downcase)
			email = email.gsub("(ln)", @search.last_name.downcase)
		end

		def display_emails(search, domain)

			emails = []
			domain.email_formats.each do |email_format|
				emails.append(convert_email_format(email_format))
			end

			return emails

		end


end
