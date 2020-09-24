require 'rails_helper'

RSpec.describe SchedulesController, type: :request do
  describe 'GET /schedules' do
    context 'when not logged in' do
      it { is_expected.to eq(302) }
    end

    context 'when logged in' do
      include_context 'when login required'
      it { is_expected.to eq(200) }
    end
  end

  describe 'POST /schedules' do
    context 'when not logged in' do
      it 'should be fail and redirect to home' do
        is_expected.to eq 302
        expect(flash[:danger]).to eq 'ログインが必要です'
      end
    end

    context 'when logged in' do
      include_context 'when login required'
      let(:schedule){ FactoryBot.create(:schedule) }

      context 'with invalid input' do
        before do
          params[:schedule] = FactoryBot.attributes_for(:schedule, :in_the_past)
        end

        it 'should be fail and redirect to new schedule page' do
          expect{subject}.to_not change(Schedule, :count)
          is_expected.to eq 302
          expect(flash[:danger]).to eq 'スケジュールの作成に失敗しました、もう一度お試しください'
        end
      end

      context 'with valid input' do
        before do
          params[:schedule] = FactoryBot.attributes_for(:schedule)
        end

        it 'should be success and redirect to user page' do
          expect{subject}.to change(Schedule, :count).by(1)
          is_expected.to eq 302
          expect(flash[:success]).to eq 'スケジュールが登録されました'
        end
      end
    end
  end

  describe 'GET /schedules/new' do
    context 'when not logged in' do
      it { is_expected.to eq(302) }
    end

    context 'when logged in' do
      include_context 'when login required'
      it { is_expected.to eq(200) }
    end
  end
end
