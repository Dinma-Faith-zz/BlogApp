class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @user = User.find(params[:user_id])
    @posts = current_user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:user, :comments).find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    @post.author_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to user_posts_path(user_id: @post.user.id), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new, alert: 'Error in creating post, please try again' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user), notice: "Successfully deleted the post #{@post.title}."
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
