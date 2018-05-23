RSpec.shared_examples 'index' do |assigned_resource, resource_class|
  it { expect(subject).to respond_with(:ok)  }
  it { expect(subject).to render_template(:index) }
  it { expect(assigns(assigned_resource)).to match_array(resource_class.all) }
end
