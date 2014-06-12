class FarmsController < ApplicationController
	before_action :authenticate_user!, :except => [:show]

	#GET "/farms/:id"
	def show
		@farm = Farm.find(params[:id])
		
		#sets up hash for map marker
		@hash = Gmaps4rails.build_markers(@farm) do |farm, marker|
		  marker.lat farm.latitude
		  marker.lng farm.longitude
		  marker.infowindow "<a target='blank' href='https://www.google.com/maps/place/"+"#{farm.address}"+"'>Get Directions With Google Maps</a>"
		  marker.json({ title: farm.name })
		end

		@links = @farm.links
		@comments = @farm.comments
	end

	#GET "/farms/:id/edit"
	def edit
		@farm = Farm.find(params[:id])
		@links = @farm.links
	end

	#PUT/PATCH "/farms/:id"
	def update
		@farm = Farm.find(params[:id])
		if @farm.update_attributes(farm_params)
			redirect_to farm_path(@farm), notice: "#{@farm.name} updated successfully."
		else
			render edit_farm_path(@farm), notice: "Error updating farm."
		end
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
