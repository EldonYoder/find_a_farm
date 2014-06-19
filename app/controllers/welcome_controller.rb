class WelcomeController < ApplicationController
	
	#GET "/"
	def index
		@recent_farms = Farm.last(6).reverse
		create_markers
	end

	# Creates all the markers for the farms... Used to on the map in the view.
	def create_markers
		@all_farms = Farm.all 
		@hash = Gmaps4rails.build_markers(@all_farms) do |farm, marker|
		  marker.lat farm.latitude
		  marker.lng farm.longitude
		  marker.infowindow "<a href='/farms/"+"#{farm.id}"+"'>#{farm.name}, #{farm.address}</a>"
		  marker.json({ title: farm.name, id: farm.id })
		end
	end
end
