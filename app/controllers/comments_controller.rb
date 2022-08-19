class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.new(text: comment_params, author_id: current_user.id, post_id: @post.id)
        if @comment.save
            redirect_to user_posts_path(user_id: @comment.post_id), notice: 'Comment Created successfully'
        else
            render :new, alert: 'Comment not created'
        end 
    end

    def comment_params
        params.require(:comment).permit(:text)[:text]
    end

end
