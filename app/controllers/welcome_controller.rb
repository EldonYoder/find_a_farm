class WelcomeController < ApplicationController
	def index
		@recent_farms = Farm.last(10)
	end
end
