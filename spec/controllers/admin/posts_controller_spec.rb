require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET index' do
    context 'when user is not signed in' do
      before do
        get :index
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        sign_in(user, scope: :user)
        get :index
      end
      it_behaves_like 'index', :posts, Post
    end
  end

  describe 'GET new' do
    context 'when user is not signed in' do
      before do
        get :new
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        sign_in(user, scope: :user)
        get :new
      end
      it_behaves_like 'new'
    end
  end

  describe 'POST create' do
    context 'when user is not signed in' do
      before do
        post :create
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        sign_in(user, scope: :user)
      end
      it_behaves_like 'successful creation', Post, 'AdminPosts', post: FactoryBot.attributes_for(:post)
      it_behaves_like 'unsuccessful creation', post: FactoryBot.attributes_for(:invalid_post)
    end
  end

  describe 'GET edit' do
    context 'when user is not signed in' do
      before do
        get :edit, params: { id: 1 }
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        post = FactoryBot.create(:post)
        sign_in(user, scope: :user)
        get :edit, params: { id: post.to_param }
        @resource = post
      end
      it_behaves_like 'edit', :post
    end
  end

  describe 'PUT update' do
    context 'when user is not signed in' do
      before do
        put :update, params: { id: 1 }
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        post = FactoryBot.create(:post)
        sign_in(user, scope: :user)
        put :update, params: { id: post.to_param, post: { title: 'edited' } }
        @resource = post.reload
      end
      it_behaves_like 'successful update', 'AdminPosts', 'title', 'edited'
      it_behaves_like 'unsuccessful update', :post, FactoryBot.attributes_for(:invalid_post)
    end
  end

  describe 'DELTE destroy' do
    context 'when user is not signed in' do
      before do
        delete :destroy, params: { id: 1 }
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      before do
        sign_in(user, scope: :user)
      end

      it 'destroy the project' do
        post = FactoryBot.create(:post)
        expect {
          delete :destroy, params: { id: post.to_param }
        }.to change(Post, :count).by(-1)
      end
    end
  end
end
