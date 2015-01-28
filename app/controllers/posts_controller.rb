class PostsController < ApplicationController
	def index
		@posts = Post.all
		render :index
	end

	def show
		@post = Post.find(params[:id])
		$redis.incr("#{Date.today.year}:#{Date.today.month}:#{Date.today.day}:posts:#{@post.id}:views")
		$redis.sadd("#{Date.today.year}:#{Date.today.month}:#{Date.today.day}:posts:#{@post.id}:uniques", request.remote_ip)
	end

	def new
		@post = Post.new
		render :new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_url(@post)
		else
			flash.now[:errors] = @post.errors.full_messages
			render :new
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
