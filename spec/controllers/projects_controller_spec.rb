require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET index' do
    before do
      get :index
    end
    it_behaves_like 'index', :projects, Project
  end

  describe 'GET show' do
    it 'show the project' do
      project = FactoryBot.create(:project)
      get :show, params: { id: project.to_param }
      expect(assigns(:project)).to eq(project)
    end
  end
end
