require 'rails_helper'

RSpec.describe 'post', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Dinma',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Developer', postcounter: 1)
    end

    let(:post) do
      Post.create!(user:, title: 'title', text: 'text', comments_counter: 0, likes_counter: 0)
    end

    let(:comment) do
      Comment.create!(author: user, post:, text: 'text')
    end

    it "shows the user's post's body" do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.text)
    end

    it 'shows who wrote the post' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.user.name)
    end

    it 'shows how many comments it has' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows how many likes it has' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.likes_counter)
    end

    it 'shows post title' do
      user.save
      post.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.title)
    end

    it 'shows comment each commentor left' do
      user.save
      post.save
      comment.save
      visit user_post_path(user, post)
      expect(page).to have_content(post.comments.first)
    end
  end
end
