RSpec.shared_examples 'new' do
  it { expect(subject).to respond_with(:ok) }
  it { expect(subject).to render_template(:new) }
end
