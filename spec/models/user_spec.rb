require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    user = User.new(name: 'example user', email: 'user@example.com')
    expect(user).to be_valid
  end
end
