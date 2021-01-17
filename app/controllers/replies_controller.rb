class RepliesController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@reply = @post.replies.create(replies_params)
    if @reply.valid?
  	  redirect_to post_path(@post), notice: "Reply successfully created!"
    else
      redirect_to post_path(@post), alert: "Invalid input, reply creation failed..."
    end
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@reply = @post.replies.find(params[:id])
  	@reply.destroy
  	redirect_to post_path(@post), notice: "Reply successfully deleted!"
  end

  private
  	def replies_params
  	  params.require(:reply).permit(:name, :body)
  	end
end