class CommentsController < ApplicationController
	def create
		@post  = Post.find(params[:post_id])
		@comment = @post.comments.create!(comments_params)
		respond_to do |format|
			format.html { redirect_to @post}
			format.js
		end
	end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end
end
