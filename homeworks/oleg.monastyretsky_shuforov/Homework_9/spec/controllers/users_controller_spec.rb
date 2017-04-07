require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before(:each) do
    session[:user_id] = User.first.id;
  end 
  it "Create user" do
    post :create, params: { user: { name: "Oleg", password: "12345" } }
    expect(response).to redirect_to('/login')
  end
  
  it "Open user page" do
    get :show, params: {id: session[:user_id]}
    expect(response).to render_template("users/show")
  end
  
  context "posts and users in json format" do
    it "Show all posts in json format" do
      get :show, params: {id: session[:user_id]}, format: :json
      expect(response.status).to eq(200)
    end
    it "Show all users in json format" do
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end

  it "Show all users page" do
    get :index
    expect(response).to render_template("users/index")
  end
  
  it "Delete user" do
    delete :destroy, params: {id: session[:user_id]}    
    expect(response.status).to eq(302)
    expect(response).to redirect_to('/login')
  end
  
end
