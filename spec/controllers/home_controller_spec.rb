require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'renders home page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
