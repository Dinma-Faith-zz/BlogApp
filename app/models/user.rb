class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy 
  has_many :comments, foreign_key: 'author_id', dependent: :destroy 
  has_many :likes, foreign_key: 'author_id', dependent: :destroy 
  validates :name, presence: true
  validates :postcounter, numericality: { greater_than_or_equal_to: 0 }

  #   A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end
