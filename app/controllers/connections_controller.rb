class ConnectionsController < ApplicationController

	#POST /connections
	def create
		@connection = Connection.new(connection_params)
		if previous_connection(@connection) == true
			gflash :notice => "You already follow this farm!"
			redirect_to :back
		else
			if @connection.save
				gflash notice: "You are now following this farm!"
				redirect_to :back
			else
				gflash notice: "Error following this farm. Please try later."
				redirect_to :back
			end
		end
	end

	private

	def previous_connection(connection)
		@connection = connection
		@connection_2 = Connection.where(user_id: @connection.user_id,  farm_id: @connection.farm_id)
		if @connection_2.length >= 1
			return true
		else
			return false
		end
	end

	def connection_params
		params.require(:connection).permit(:user_id, :farm_id)
	end
end
