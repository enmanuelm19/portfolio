RSpec.shared_examples 'successful update' do |object_class, attribute, expected_change|
  it { expect(response).to redirect_to eval("#{object_class.to_s.underscore.pluralize}_path") }
  it { expect(@resource.send(attribute)).to eq(expected_change) }
end
