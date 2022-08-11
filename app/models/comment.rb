class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create :update_comments_counter

  private

  #   A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
