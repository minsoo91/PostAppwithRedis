class CommentsController < ApplicationController
	def show
		@comment = Comment.find(params[:id])
		render :show
	end

	def new
		@comment = Comment.new
		render :new
	end

	def create
		@post = Post.find_by_id(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save
			redirect_to @post
		else
			render :new
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:post_id, :body)
	end
end
