class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to :back, notice: "comment added."
		else
			redirect_to :back, notice: "error adding comment"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to farm_path(@comment.farm.id), notice: "comment deleted..."
		else
			redirect_to farm_path(@comment.farm.id), notice: "unable to delete comment, please try again!"
		end
	end

	private

	def comment_params
		params.require(:comment).permit!
	end

end
