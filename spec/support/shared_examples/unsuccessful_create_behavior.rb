RSpec.shared_examples 'unsuccessful creation' do |attributes|
  it '' do
    post :create, params: attributes
    expect(response).to render_template(:new)
  end
end
