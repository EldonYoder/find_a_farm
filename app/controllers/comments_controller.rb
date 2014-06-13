class CommentsController < ApplicationController
	before_action :authenticate_user!

	# POST "/comments"
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			gflash  notice: "comment added."
			redirect_to :back
		else
			gflash notice: "error adding comment"
			redirect_to :back 
		end
	end

	#DELETE "comments/:id"
	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			gflash notice: "comment deleted..."
			redirect_to farm_path(@comment.farm.id) 
		else
			gflash notice: "unable to delete comment, please try again!"
			redirect_to farm_path(@comment.farm.id) 
		end
	end

	private

	def comment_params
		params.require(:comment).permit!
	end

end
