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
