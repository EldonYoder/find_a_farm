class RatingsController < ApplicationController

	def create	
		@rating = Rating.new(rating_params)
		@rating.user_id = current_user.id

		if previous_rating(@rating) == true
			redirect_to :back, notice: "You can only rate a farm once."
		else
			if @rating.save
				redirect_to :back, notice: "Your feedback has been recorded. Thanks for your input!"
			else
				redirect_to :back, notice: "There was an error while saving your feedback. Please try again."
			end
		end
	end

	private

	def previous_rating(rating)
		@rating = rating
		@rating_2 = Rating.where(user_id: current_user.id, rateable_type: @rating.rateable_type, rateable_id: @rating.rateable_id)
		if @rating_2.length == 1
			return true
		else
			return false
		end
	end

	def rating_params
		params.require(:rating).permit!
	end
end
