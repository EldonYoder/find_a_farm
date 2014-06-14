class UsersController < ApplicationController
	before_action :authenticate_user!

	#GET "/users/:id" 
	def show
		@user = User.find(params[:id])
		@farms = @user.farms
		@connections = @user.connections
	end

end