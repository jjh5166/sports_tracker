class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'date'
  USERNAME = open('lib/assets/.username').first.chomp
  PASSWORD = open('lib/assets/.password').first.chomp
  $msf = MySportsFeeds.new(version="1.2", true)
  $msf.authenticate(USERNAME, PASSWORD)


#### DEVISE ####

  #To permit additional devise params
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
   # Overwriting the sign_up redirect path method
  def after_sign_up_path_for(resource_or_scope)
    root_path
  end


  protected
  
	#Permitting specific params for devise
	def configure_permitted_parameters
 		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
 		devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
 		devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
	end


end
