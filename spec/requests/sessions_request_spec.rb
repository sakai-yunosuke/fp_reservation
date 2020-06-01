require 'rails_helper'

RSpec.describe SessionsController, type: :request do

  describe 'GET /login' do
    it { is_expected.to eq(200) }
  end

  describe 'POST /login' do
    context 'with invalid login information' do
      before do
        params[:session] = { email: '', password: '' }
      end

      it 'should fail singup and show error message' do
        is_expected.to eq 200
        expect(flash[:danger]).to eq 'Invalid email or password combination'
      end
    end
  end

end
