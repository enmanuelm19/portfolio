RSpec.shared_examples 'unsuccessful update' do |key, attributes|
  it '' do
    params = { id: @resource.id }
    params[key] = attributes
    put :update, params: params
    expect(response).to render_template(:edit)
  end
end
