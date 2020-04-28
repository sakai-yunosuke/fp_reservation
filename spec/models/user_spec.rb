require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ build(:user) }

  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
    end

    context 'length' do
      it { should validate_length_of(:name).is_at_most(50) }
      it { should validate_length_of(:email).is_at_most(255) }
      it { should validate_length_of(:password).is_at_least(8) }
    end

    context 'email uniqueness' do
      it { should validate_uniqueness_of(:email).case_insensitive }
    end

    context 'email format' do
      it do
        should allow_values(
          'user@example.com',
          'USER@foo.COM',
          'A_US-ER@foo.bar.org',
          'first.last@foo.jp',
          'alice+bob@baz.cn'
        ).for(:email)
      end

      it do
        should_not allow_values(
          'user@example,com',
          'user_at_foo.org',
          'user.name@example.',
          'foo@bar_baz.com',
          'foo@bar+baz.com'
        ).for(:email)
      end
    end
  end
end
