require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe 'GET index' do
    context 'when user is not signed in' do
      before do
        get :index
      end
      it_behaves_like 'unauthenticated'
    end

    context 'when user is signed in' do
      it 'renders the dashboard' do
        sign_in(user, scope: :user)
        get :index
        expect(response).to render_template(:index) 
      end
    end
  end
end
