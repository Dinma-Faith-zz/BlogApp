require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Hello Microverse') }
  before { subject.save }

  it 'No comment raise error' do
    expect { subject.comments_counter }.to raise_error(NoMethodError)
  end
end
