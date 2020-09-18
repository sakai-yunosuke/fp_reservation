RSpec.shared_context 'when login required' do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
  end
end

RSpec.configure do |config|
  config.include_context 'when login required', :login_required
end
