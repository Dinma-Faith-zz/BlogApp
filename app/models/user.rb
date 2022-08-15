class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :postcounter, numericality: { greater_than_or_equal_to: 0 }

  #   A method that returns the 3 most recent posts for a given user.
  def posts_recent
    posts.order(created_at: :desc).limit(3)
  end
end
