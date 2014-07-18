require 'pry'
require 'rest_client'
require 'json'

class SearchesController < ApplicationController

	before_filter :authenticate_user!, except: [:new]

	def new
		@search = Search.new
	end

	def show
		@search = Search.find(params[:id])
		if @search.users.include?(current_user)
			@new_search = Search.new
			@new_search.assign_attributes(full_name: @search.full_name, 
										  domain_name: @search.domain_name)
			@domain = Domain.find_by_name(@search.domain_name)
		else
			redirect_to root_path, alert: "You can only see your own search results"
		end
	end

	def create
		
		@search = Search.where(full_name: params[:search][:full_name].downcase, domain_name: params[:search][:domain_name].downcase).first
		
		if current_user
			unless @search.blank?
				redirect_to search_path(@search.id)
			else
				@search = Search.new(search_params)
				@search.users.append(current_user)
				@search.results = display_emails(@search)
				get_search_status

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
		else
			redirect_to new_user_session_path, alert: "You are not logged in."
		end
	end

	private
		def search_params
			params.require(:search).permit(:full_name, :domain_name, :user)
		end

		def get_search_status
			
			status = Status.find_by_name("invalid")

			@search.results.each do |email, response|
				response = response.to_i
				if response == 200
					status = Status.find_by_name("confirmed")
				elsif response == 207 or response == 215
					status = Status.find_by_name("possible")
				end
			end

			@search.status = status
			
		end

		def convert_email_format(format)
			if @search.domain_name.include?("www.")
				@search.domain_name.slice!("www.")
			end

			name_array = @search.full_name.split(" ")
			first_name = name_array.shift
			last_name = name_array.pop()
			if not name_array.empty? 
				middle_name = name_array.pop()[0]
			end

			email = format + "@" + @search.domain_name.downcase
			if not first_name.nil?
				email = email.gsub("(fn)", first_name.downcase)
				email = email.gsub("(fnfl)", first_name[0].downcase)
			end

			if not last_name.nil?
				email = email.gsub("(ln)", last_name.downcase)
			end

			if not middle_name.nil?
				email = email.gsub("(mi)", middle_name.downcase)
			end

			return email
		end

		def display_emails(search)

			emails = {}
			EmailFormat.all.each do |email_format|
				format = email_format.format
				email =  convert_email_format(format)
				emails[email] = confirm_email(email)
				#emails[format] = [email, 114]
			end

			return emails

		end

		def confirm_email(email)
			response = RestClient.get "http://www.email-validator.net/api/verify?EmailAddress=#{email}&APIKey=#{ENV["EMAIL_VALIDATOR_API_KEY"]}" 
			response = JSON.parse response
			return response["status"]
		end


end
