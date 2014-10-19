class EmailFormatsController < ApplicationController
	# before_filter :authenticate_user!
	# before_filter :require_admin

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

		def require_admin
			unless current_user.admin?
				flash[:alert] = "You must be an admin to access this section"
				redirect_to root_path
			end
		end

end
