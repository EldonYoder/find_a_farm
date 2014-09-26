class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			gflash notice: "You're post has been created!"
			redirect_to post_path(@post)
		else
			gflash notice: "Error saving your post, make sure you've filled out everything."
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit!
	end

end
