require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
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
      it_behaves_like 'index', :projects, Project
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
      it_behaves_like 'successful creation', Project, 'AdminProjects', project: FactoryBot.attributes_for(:project)
      it_behaves_like 'unsuccessful creation', project: FactoryBot.attributes_for(:invalid_project)
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
        project = FactoryBot.create(:project)
        sign_in(user, scope: :user)
        get :edit, params: { id: project.to_param }
        @resource = project
      end
      it_behaves_like 'edit', :project
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
        project = FactoryBot.create(:project)
        sign_in(user, scope: :user)
        put :update, params: { id: project.to_param, project: { title: 'edited' } }
        @resource = project.reload
      end
      it_behaves_like 'successful update', 'AdminProjects', 'title', 'edited'
    end
  end
end
