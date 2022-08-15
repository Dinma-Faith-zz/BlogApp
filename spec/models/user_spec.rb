require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'John'
    subject.postcounter = 0
    expect(subject).to be_valid
  end

  it 'check post count to be  >= 0' do
    subject.postcounter = -1
    expect(subject).to_not be_valid
  end
end
