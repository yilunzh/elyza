class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	def associate_email_formats_with_domain(domain)
  		EmailFormat.all.each do |format|
			domain.email_formats << format
			domain.configurations.each do |config|
				config.score = 0
			end
		end
	end
end
