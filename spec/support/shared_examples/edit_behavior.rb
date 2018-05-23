RSpec.shared_examples 'edit' do |assigned_resource|
  it { expect(subject).to respond_with(:ok) }
  it { expect(subject).to render_template(:edit) }
  it { expect(assigns(assigned_resource)).to eq(@resource) }
end
