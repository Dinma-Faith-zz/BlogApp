require 'rails_helper'

RSpec.describe 'post', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Dinma',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Developer', postcounter: 1)
    end

    let(:post) do
      Post.create!(user:, title: 'title', text: 'Hey there', comments_counter: 0, likes_counter: 0)
    end

    let(:comment) do
      Comment.create!(author: user, post:, text: 'text')
    end

    it "shows the user's name" do
      user.save
      post.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.user.name)
    end

    it 'shows the profile picture of user' do
      user.save
      post.save
      visit user_posts_path(user, post)
      find("img[src='https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg']")
    end

    it "shows the user's post's title" do
      user.save
      post.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.title)
    end

    it "shows the post's body" do
      user.save
      post.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.text)
    end

    it 'shows the first comments on a post' do
      user.save
      post.save
      comment.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.comments.first)
    end

    it 'shows how many comments a post has' do
      user.save
      post.save
      comment.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows how many likes a post has' do
      user.save
      post.save
      comment.save
      visit user_posts_path(user, post)
      expect(page).to have_content(post.likes_counter)
    end

    it 'redirects me to that post"s show page when link is clicked' do
      user.save
      post.save
      comment.save
      visit user_posts_path(user, post)
      click_link post.title
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end
end
