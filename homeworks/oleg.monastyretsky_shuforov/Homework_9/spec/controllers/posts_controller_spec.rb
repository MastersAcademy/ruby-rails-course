require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "User posts" do
    before(:each) do
      session[:user_id] = User.first.id;
      @user = User.first
      @user.posts.create title: 'test', body: 'post'
    end
    context "Create show edit delete post" do
      it "Create post" do
        post :create, params: {post: {title: 'first', body: 'post'},
                               commit: "Create post", user_id: session[:user_id]}
        # expect(response).to redirect_to("/users/#{session[:user_id]}")
        expect(response.status).to eq(302)
        # expect(Post.all).to eq(000)
      end
      
      it "Show all posts of user" do
        get :index, params: {user_id: session[:user_id]}
        expect(response.status).to eq(200)
      end

      it "Edit post in user posts" do
        patch :update, params: { post: { title: "fires Post", body: "n2225555" },
                                 commit: "Edit post", user_id: session[:user_id],
                                 id: Post.find_by(user_id: session[:user_id]).id}
        #expect(response).to redirect_to("/users/#{session[:user_id}")
        expect(response.status).to eq(302)
        # expect(Post.all).to eq(222)
      end
    end
  
    it "Delete post in user posts" do
      delete :destroy, params: {user_id: session[:user_id],
                                id: Post.find_by(user_id: session[:user_id]).id}
      # expect(response).to redirect_to("/users/#{session[:user_id]}")
      expect(response.status).to eq(302)
      # expect(Post.all).to eq("Slayer")
    end
  end  
  describe "All posts" do
    before(:each) do
      session[:user_id] = User.first.id;
      @user = User.first
      @user.posts.create title: 'test', body: 'post'
    end
    context "Create edit delete post on main page" do
      it "Create post" do
        post :create, params: {post: {title: 'first', body: 'post'},
                               commit: "Create post", user_id: session[:user_id]}
        #expect(response).to redirect_to("/users/#{session[:user_id]}")
        expect(response.status).to eq(302)
        #      expect(Post.all).to eq(000)
      end

      it "Edit post on home user page" do
        patch :update, params: { post: { title: "fires Post", body: "n2225555" },
                                 commit: "Edit post", user_id: session[:user_id],
                                 id: Post.find_by(user_id: session[:user_id]).id}
        #expect(response).to redirect_to("/users/#{session[:user_id}")
        expect(response.status).to eq(302)
        # expect(Post.all).to eq(222)
      end
      
      it "Delete post on home user page" do
        delete :destroy, params: {user_id: session[:user_id],
                                  id: Post.find_by(user_id: session[:user_id]).id}
        # expect(response).to redirect_to("/users/#{session[:user_id]}")
        expect(response.status).to eq(302)
        # expect(Post.all).to eq("Slayer")
      end
    end
  end
end
