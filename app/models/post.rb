class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  #   A method that updates the posts counter for a user.
  def update_posts_counter
    user.increment!(:postcounter)
  end

  #   A method which returns the 5 most recent comments for a given post.
  def most_recent_five_comments
    comment.order(created_at: :DESC).limit(5)
  end
end
