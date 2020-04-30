require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe 'GET /signup' do
    it { is_expected.to eq(200) }
  end

  describe 'POST /signup' do
    context 'when signup information is valid' do
      it 'should be successful request' do
        post signup_path, params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
      end

      it 'should be success signup' do
        expect do
          post signup_path, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it 'should redirect to user page' do
        post signup_path, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to User.last
      end
    end

    context 'when signup information is invalid' do
      it 'should be successful request' do
        post signup_path, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 200
      end

      it 'should be fail signup' do
        expect do
          post signup_path, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User, :count)
      end

      it 'should show error message' do
        post signup_path, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.body).to include 'errors'
      end
    end
  end

end
