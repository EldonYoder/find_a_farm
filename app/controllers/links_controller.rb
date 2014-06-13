class LinksController < ApplicationController
	before_action :authenticate_user!

	def edit
		@link = Link.find(params[:id])
	end

	def update
		@link = Link.find(params[:id])
		if @link.update_attributes(link_params)
			gflash notice: "Link updated."
			redirect_to edit_farm_path(@link.farm)
		else
			gflash notice: "Error updating link."
			render :back
		end
	end

	def create
		@link = Link.new(link_params)
		if @link.save
			gflash notice: "Link added."
			redirect_to edit_farm_path(@link.farm_id)
		else
			gflash notice: "Error creating link. Please try again."
			redirect_to edit_farm_path(@link.farm_id)
		end
	end

	def destroy
		@link = Link.find(params[:id])
		if @link.delete
			gflash notice: "Link Deleted"
			redirect_to edit_farm_path(@link.farm)
		else
			gflash notice: "Error Deleteing Link, please try agin."
			redirect_to edit_farm_path(@link.farm)
		end
	end

	private

	def link_params
		params.require(:link).permit!
	end
end
