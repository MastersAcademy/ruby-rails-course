require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, :type => :model do
  it 'should check user id' do
    post = Post.new(user_id: 1)
    expect(post.user_id).to eq(1)
  end
end