class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) #find the post and assign it to an instance variable
    @comment = @post.comments.create(comments_params) #find the comment for that particular post against certain parameters and assign it to @comment instance var
    redirect_to post_path(@post) #redirect us to where the path of that particular post is
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end


end