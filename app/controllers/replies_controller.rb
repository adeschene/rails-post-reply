class RepliesController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@reply = @post.replies.create(replies_params)
  	redirect_to post_path(@post)
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@reply = @post.replies.find(params[:id])
  	@reply.destroy
  	redirect_to post_path(@post)
  end

  private
  	def replies_params
  	  params.require(:reply).permit(:name, :body)
  	end
end