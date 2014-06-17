require 'pry'
require 'rest_client'
require 'json'

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
		@emails = display_emails(@search)

	end

	def create
		@search = Search.new(search_params)
		if @search.save
			if Domain.find_by_name(search_params[:domain_name])
				redirect_to search_path(@search)
			else
				@domain = Domain.new(name: search_params[:domain_name])
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

		def convert_email_format(format)
			if @search.domain_name.include?("www.")
				@search.domain_name.slice!("www.")
			end
			email = format + "@" + @search.domain_name.downcase
			email = email.gsub("(fn)", @search.first_name.downcase)
			email = email.gsub("(fnfl)", @search.first_name[0].downcase)
			email = email.gsub("(ln)", @search.last_name.downcase)
		end

		def display_emails(search)

			emails = {}
			EmailFormat.all.each do |email_format|
				format = email_format.format
				email =  convert_email_format(format)
				emails[format] = [email, confirm_email(email)]
				#emails[format] = [email, 114]
			end
			binding.pry

			return emails

		end

		def confirm_email(email)
			response = RestClient.get "http://www.email-validator.net/api/verify?EmailAddress=#{email}&APIKey=ev-ceba647090c72c15f0c2d608b22ff943" 
			response = JSON.parse response
			return response["status"]
		end


end
