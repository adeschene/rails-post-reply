class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  	  redirect_to root_path, notice: "Post successfully created!"
  	else
  	  redirect_to root_path, alert: "Invalid input, post creation failed..."
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update(post_params)
  	  redirect_to @post, notice: "Post successfully updated!"
  	else
      flash.now[:alert] = "Invalid input, post update failed..."
  	  render :edit
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy

  	redirect_to root_path, notice: "Post successfully deleted!"
  end

  private
  	def post_params
  	  params.require(:post).permit(:title, :body)
  	end
end