class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post_new = Post.new
	end
	def new
		@post =Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			flash[:notice] = "post saved"
			redirect_to posts_path
		else
			logger.debug("error")
		end
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end