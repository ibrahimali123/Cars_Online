#author: IBRAHIM ALI EBEIDO
#purpose: enable more fileds in sign up

class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
        	   if resource_class == User # check if i use manager class then add this attr. to register method
        	  	 devise_parameter_sanitizer.for(:sign_up) << :firstName << :lastName << :email << :password << :Phone << :City << :Address  << :profilephoto
        	     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:Phone,:firstName,:lastName,:City ,:Address, :profilephoto , :email, :current_password,:password,:password_confirmation) }
        	   end   
        end
end
