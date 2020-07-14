require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    before do
      get :index
    end
    it_behaves_like 'index', :posts, Post
  end

  describe 'GET show' do
    it 'fetch a specific post' do
      post = FactoryBot.create(:post)
      get :show, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)
    end
  end
end
