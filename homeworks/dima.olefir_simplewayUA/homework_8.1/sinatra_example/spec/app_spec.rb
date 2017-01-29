require 'rack/test'
require 'rspec'
require './app'


describe 'user' do
  it 'should create user' do
    @user = User.new(:id => 1, :name => 'Name')
    expect(@user.id).to eq(1)
    expect(@user.name).to eq('Name')
  end
end

describe 'post' do
  it 'should check user id' do
    @post = Post.new(:user_id => 1)
    expect(@post.user_id).to eq(1)
  end
end

