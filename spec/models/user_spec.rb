require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = ''
    expect(@user).to_not be_valid
  end

  it 'email should be present' do
    @user.email = ''
    expect(@user).to_not be_valid
  end
end
