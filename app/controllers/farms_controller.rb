class FarmsController < ApplicationController
	before_action :authenticate_user!

	#GET "/farms/:id"
	def show
		@farm = Farm.find(params[:id])
	end

	# GET "/farms/new" 
	def new
		@farm = Farm.new
	end

	# POST "/farms"
	def create
		@farm = Farm.new(farm_params)
		@farm.user_id = current_user.id
		if @farm.save
			redirect_to farm_path(@farm), notice: "Welcome to the family! We are glad you've chosen us to help represent your farm."
		else
			render :back, notice: "There was an error adding your farm. Please make sure you filled everything out."
		end
	end

	private

	def farm_params
		params.require(:farm).permit!
	end

end
