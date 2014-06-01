require 'pry'

class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def show
		@search = Search.find(params[:id])
		@domain = Domain.find_by_name(@search.domain_name)
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



end
