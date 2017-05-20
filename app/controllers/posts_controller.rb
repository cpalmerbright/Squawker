class PostsController < ApplicationController

  before_action :set_post, only: [:show, :destroy]
  def index
    @posts = Post.all
    authorize @posts
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

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
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
