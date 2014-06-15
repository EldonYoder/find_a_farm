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
		@rating = Rating.where(rateable_type: "Farm", rateable_id: @farm.id).average(:rate_value)
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
			render :back
		end
	end

	# GET "/farms/search"
	def search
		if params[:search].present?
			@farms = Farm.near(params[:search], 100)
			if @farms.present?
				search_map(@farms)
			elsif @farms.empty?
				@farms = Farm.near(params[:search], 500)
				search_map(@farms)				
				if @farms.empty?
					gflash notice: "Sorry we couldn't find any farms in our system near #{params[:search].titleize}."
					redirect_to "/"
				end
			end
		end
	end

	private

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
