require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'fetch all posts' do
      get :index
      expect(assigns(:posts)).to match_array(Post.all)
    end
  end

  describe 'GET show' do
    it 'fetch a specific post' do
      post = FactoryBot.create(:post)
      get :show, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)  
    end
  end
end
