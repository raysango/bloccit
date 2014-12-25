class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to(:back)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end 
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
    else
      flash[:error] = "Comment couldn't be remove try again"
    end
    respond_with(@comment) do |format|
      format.html {redirect_to[@post.topic, @post]}
    end
  end
    
    def comment_params
      params.require(:comment).permit(:body,:post_id)
    end
end