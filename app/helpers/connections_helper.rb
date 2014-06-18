module ConnectionsHelper
	
	def has_connected(user, farm)
		@user = user
		@farm = farm
		@connection = Connection.where(user_id: @user.id, farm_id: @farm.id)
		if @connection.length >= 1
			return true
		else
			return false
		end
	end

end
