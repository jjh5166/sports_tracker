class UsersController < ApplicationController
	before_action :authenticate_user!
#Built-in devise methods
	# user_signed_in?
	# current_user
	# user_session
	def profile
		@user = User.find_by_id(current_user.id)
		@pics = Picture.where(user_id: current_user.id)
	end

end
