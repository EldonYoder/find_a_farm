module RatingsHelper

	def has_rated(user, farm)
		@user = user
		@farm = farm
		@rating = Rating.where(user_id: @user.id, rateable_type: "Farm", rateable_id: @farm.id)
		if @rating.length >= 1
			return true
		else
			return false
		end
	end
end
