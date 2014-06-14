class UsersController < ApplicationController
	before_action :authenticate_user!

	#GET "/users/:id" 
	def show
		@user = User.find(params[:id])
		@farms = @user.farms
		@connections = @user.connections
		@farms_followed = find_users_followed_farms(@connections)
	end

	private

	# Finds all the farms that a user has a followed
	def find_users_followed_farms(connections)
		@connections = connections
		@connected_farms = []

		@connections.each do |c|
			d = Farm.where(id: c.farm_id)
			@connected_farms << d[0]
		end
		puts @connected_farms
		@connected_farms
	end

end