class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	
  	@comment = @post.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save

  	redirect_to @post
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to @comment.post
  end

  private 

    def comment_params
      params.require(:comment).permit(:text, :user_id, :post_id)
    end
end
