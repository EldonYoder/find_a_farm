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
		@rating = Rating.where(rateable_type: "Farm", rateable_id: @farm.id).average(:rate_value)
	end

	#GET "/farms/:id/followers"
	def followers
		@farm = Farm.find(params[:id])
		@connections = @farm.connections
		@followers = find_followers(@connections)
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
			gflash notice: "#{@farm.name} updated successfully."
			redirect_to farm_path(@farm)
		else
			gflash notice: "Error updating farm."
			render edit_farm_path(@farm) 
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
			gflash notice: "Welcome to the family! We are glad you've chosen us to help represent your farm."
			redirect_to farm_path(@farm)
		else
			gflash :now, notice: "There was an error adding your farm. Please make sure you filled everything out."
			render :back
		end
	end

	private

	def find_followers(connections)
		@connections = connections
		@users = []

		@connections.each do |c|
			d = User.where(id: c.user_id)
			@users << d[0]
		end
		@users
	end

	def farm_params
		params.require(:farm).permit!
	end

end
