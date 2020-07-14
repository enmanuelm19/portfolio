RSpec.shared_examples 'successful creation' do |object_class, redirect_object, attributes|
  it {
    expect { post :create, params: attributes }.to change(object_class, :count).by(1)
    expect(response).to redirect_to eval("#{redirect_object.to_s.underscore.pluralize}_path")
  }
end
