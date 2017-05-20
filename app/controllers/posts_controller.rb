class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Your post has been created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
