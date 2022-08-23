class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(author_id: current_user.id, post_id: @post.id)
    if @like.save
      redirect_to user_posts_path(user_id: @like.post_id), notice: 'Created like successfully'
    else
      render :new, alert: 'likes not created'
    end
  end
end
