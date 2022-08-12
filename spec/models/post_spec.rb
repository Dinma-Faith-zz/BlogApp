require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user1 = User.create!(name: 'John',
                         photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F
                     _217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg', bio: 'Microverse_student', postcounter: 0)
    Post.create!(title: 'My Title',
                 text: 'This post is my first post', likes_counter: 0, comments_counter: 0, user: user1)
  end

  describe 'Post Model validations' do
    it 'check for invalid if title"s column is empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if likes_counters is empty' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if comments_counter is empty' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if text is more than 250 characters' do
      subject.title = 'A' * 260
      expect(subject).to_not be_valid
    end
  end
end
