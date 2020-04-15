require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end
end
