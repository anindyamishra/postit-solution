class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(check_params)
    if @comment.save
      flash[:notice] = "Comments added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
  
  private
  def check_params
    params.require(:comment).permit(:body)
  end
  
end