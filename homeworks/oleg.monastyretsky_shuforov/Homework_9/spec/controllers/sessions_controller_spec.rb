require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  it "login page" do
    get :new
    expect(response).to render_template("/")
  end

  it "User login" do
    post :create, params: { session: { name: "Oleg", password: "12345" } }
    expect(session[:user_id]).to equal(User.find(session[:user_id]).id)
  end

  it "User logout" do
    get :destroy
    expect(session[:user_id]).to equal(nil)
  end

end
