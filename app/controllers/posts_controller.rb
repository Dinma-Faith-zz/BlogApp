class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
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
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to user_posts_path(user_id: @post.user.id), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new, alert: 'Error in creating post' }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
