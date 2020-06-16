require 'rails_helper'

RSpec.describe SessionsController, type: :request do

  describe 'GET /sessions/new' do
    it { is_expected.to eq(200) }
  end

  describe 'POST /sessions' do
    let(:user) { FactoryBot.create(:user) }

    context 'with invalid login information' do
      before do
        params[:session] = { email: '', password: '' }
      end

      it 'should fail login and show error message' do
        is_expected.to eq 200
        expect(flash[:danger]).to eq 'Invalid email or password combination'
      end
    end

    context 'with valid login information' do
      before do
        params[:session] = { email: user.email, password: user.password }
      end

      it 'should success login and redirect to user page' do
        is_expected.to eq 302
        expect(response).to redirect_to user
      end
    end
  end
end
