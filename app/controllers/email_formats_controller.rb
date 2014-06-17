class EmailFormatsController < ApplicationController
	def index
		@email_formats = EmailFormat.all
	end

	def new
		@email_format = EmailFormat.new
	end

	def create
		@email_format = EmailFormat.new(email_format_params)
		if @email_format.save
			redirect_to email_formats_path
		else
			render 'new'
		end
	end

	def edit
		@email_format = EmailFormat.find(params[:id])
	end

	def update
		@email_format = EmailFormat.find(params[:id])
		if @email_format.update_attributes(email_format_params)
			redirect_to email_formats_path
		else
			render 'edit'
		end

	end

	def destroy
		@email_format = EmailFormat.find(params[:id])
		@email_format.destroy
		flash[:success] = "email format has been successfully destroyed"
		redirect_to email_formats_path
	end

	private
		def email_format_params
			params.require(:email_format).permit(:format)
		end

end
