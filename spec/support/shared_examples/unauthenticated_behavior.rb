RSpec.shared_examples 'unauthenticated' do
  it { expect(subject).to respond_with(302) }
  it { expect(subject).to redirect_to new_user_session_path }
end