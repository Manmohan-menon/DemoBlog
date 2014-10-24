class CommentsController < ApplicationController
	def create
		@post  = Post.find(params[:post_id])
		@comment = @post.comments.create!(comments_params)
		redirect_to @post
	end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
