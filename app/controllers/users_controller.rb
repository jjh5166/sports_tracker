class UsersController < ApplicationController
	before_action :authenticate, except: :profile
#Built-in devise methods
	# user_signed_in?
	# current_user
	# user_session
	def profile
		@user = User.where(username: params[:username])[0]
		@pics = Picture.where(user_id: @user.id).reverse

	end
end
