class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: 'Your comment has been created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render post_path(@comment.post) }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
