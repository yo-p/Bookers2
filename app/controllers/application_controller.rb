class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		user_path(resource.id)
	end
	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:top, :about]


	protected
	 def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	    #devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
	    #devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
	 end

end
