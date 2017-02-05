require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :models do
  it 'should create user' do
    expect(User.new(name: 'Name', email: 'email@gmail.com', password: 'Fe2Lsl')).to be_valid
  end

  context 'check password' do
    it 'validation allows passwords larger than 4 and less than 8' do
      good_password = User.create(name: 'Name', email: 'tester@gmail.com')
      good_password.password = 'password12'
      expect(good_password).to be_valid
    end

    it 'small password # < 4' do
      bad_password = User.create(name: 'Name', email: 'tester@gmail.com')
      bad_password.password = 'a12'
      expect(bad_password).to_not be_valid
    end
  end
end