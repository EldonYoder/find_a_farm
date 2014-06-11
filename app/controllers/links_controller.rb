class LinksController < ApplicationController

	def create
		@link = Link.new(link_params)
		if @link.save
			redirect_to farm_path(@link.farm_id), notice: "Link added."
		else
			redirect_to farm_path(@link.farm_id), notice: "Error creating link. Please try again."
		end
	end

	private

	def link_params
		params.require(:link).permit!
	end
end
