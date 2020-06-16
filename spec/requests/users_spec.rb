require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe 'GET /users/new' do
    it { is_expected.to eq(200) }
  end

  describe 'POST /users' do
    context 'with valid singup information' do
      before do
        params[:user] = FactoryBot.attributes_for(:user)
      end

      it 'should be success and redirect to user page' do
        expect{subject}.to change(User, :count).by(1)
        is_expected.to eq 302
        expect(response).to redirect_to User.last
      end
    end

    context 'with invalid signup information' do
      before do
        params[:user] = FactoryBot.attributes_for(:user, :invalid)
      end

      it 'should be fail signup' do
        expect{subject}.to_not change(User, :count)
        is_expected.to eq 200
        expect(response.body).to include 'errors'
      end
    end
  end
end
