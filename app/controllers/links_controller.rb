class LinksController < ApplicationController
	before_action :authenticate_user!

	def edit
		@link = Link.find(params[:id])
	end

	def update
		@link = Link.find(params[:id])
		if @link.update_attributes(link_params)
			redirect_to edit_farm_path(@link.farm), notice: "Link updated."
		else
			render :back, notice: "Error updating link."
		end
	end

	def create
		@link = Link.new(link_params)
		if @link.save
			redirect_to edit_farm_path(@link.farm_id), notice: "Link added."
		else
			redirect_to edit_farm_path(@link.farm_id), notice: "Error creating link. Please try again."
		end
	end

	def destroy
		@link = Link.find(params[:id])
		if @link.delete
			redirect_to edit_farm_path(@link.farm), notice: "Link Deleted"
		else
			redirect_to edit_farm_path(@link.farm), notice: "Error Deleteing Link, please try agin."
		end
	end

	private

	def link_params
		params.require(:link).permit!
	end
end
