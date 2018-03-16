class UsersController < ApplicationController
	before_action :authenticate_user!
#Built-in devise methods 
	# user_signed_in?
	# current_user
	# user_session


end
