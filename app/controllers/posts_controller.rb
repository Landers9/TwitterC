class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def confirm
    @post = Post.new(post_params)
  end

  def edit

  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.'}
      else
        format.html { render :edit }
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post was successfully created!!"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.'}
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
