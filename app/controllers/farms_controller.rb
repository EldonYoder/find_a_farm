class FarmsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :search]

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
		@rating = Rating.where(rateable_type: "Farm", rateable_id: @farm.id)
		@rating_num = @rating.length
		@rating_average = @rating.average(:rate_value).round(2)
		if current_user
			@connection = Connection.where(user_id: current_user.id, farm_id: @farm.id)
		end
	end

	#GET "/farms/:id/followers"
	def followers
		@farm = Farm.find(params[:id])
		if is_owner(@farm)
			@connections = @farm.connections
		else
			gflash notice: "You don't have permission to go there."
			redirect_to farm_path(@farm)
		end
	end

	#GET "/farms/:id/edit"
	def edit
		@farm = Farm.find(params[:id])
		if is_owner(@farm)	
			@links = @farm.links
		else
			gflash notice: "You don't have permission to go there."
			redirect_to farm_path(@farm)
		end
	end

	#PUT/PATCH "/farms/:id"
	def update
		@farm = Farm.find(params[:id])
		if is_owner(@farm)
			if @farm.update_attributes(farm_params)
				gflash notice: "#{@farm.name} updated successfully."
				redirect_to farm_path(@farm)
			else
				gflash notice: "Error updating farm."
				render edit_farm_path(@farm) 
			end
		else 
			gflash notice: "You don't have permission to go there."
			redirect_to farm_path(@farm)
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
			render :new
		end
	end

	# GET "/farms/search"
	def search
		@location = params[:search]
		@distance = params[:miles]
		@farms = Farm.near(@location, @distance)

		if @location.empty?
			gflash notice: "You can't search without a search term; please enter a location and retry!"
			redirect_to "/"
		else
			if @farms.length < 1
				gflash notice: "Sorry! We couldn't find any farms within #{@distance} miles of #{@location}."
				redirect_to "/"
			else
				search_map(@farms)
			end
		end

	end

	private

	# sets up the map hash for gmaps4rails
	def search_map(farms)
		@farms = farms
		@hash = Gmaps4rails.build_markers(@farms) do |farm, marker|
			  marker.lat farm.latitude
			  marker.lng farm.longitude
			  marker.infowindow "<a href='/farms/"+"#{farm.id}"+"'>#{farm.name}, #{farm.address}</a>"
			  marker.json({ title: farm.name, id: farm.id })
			end
		end

	def is_owner(farm)
		@farm = farm
		if current_user.id == @farm.user_id
			return true
		else
			return false
		end
	end
	
	def farm_params
		params.require(:farm).permit!
	end

end
