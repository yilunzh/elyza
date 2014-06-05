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
			redirect_to search_path(@search)
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
			confirmed_emails = []
			unconfirmed_emails = []

			EmailFormat.all.each do |unconfirmed_email_format|
				
				if domain.email_formats.any?
					domain.email_formats.each do |confirmed_email_format|
						if confirmed_email_format.format == unconfirmed_email_format.format
							confirmed_emails.append(convert_email_format(confirmed_email_format))
						else
							unconfirmed_emails.append(convert_email_format(unconfirmed_email_format))
						end
					end
				else
					unconfirmed_emails.append(convert_email_format(unconfirmed_email_format))
				end
				
			end

			return emails = { "confirmed" => confirmed_emails,
			 		  		  "unconfirmed" => unconfirmed_emails }

		end


end
