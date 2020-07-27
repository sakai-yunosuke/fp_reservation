require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should belong_to(:user) }
      it { should belong_to(:schedule) }
    end

    context 'when double booking' do
      let(:user){ create(:user) }
      let!(:reservation1){ create(:reservation, user: user) }
      let(:reservation2){ build(:reservation, user: user) }

      it { 
        expect(reservation2).not_to be_valid
        expect(reservation2.errors.full_messages).to eq ['Schedule : 同じ時間帯に他の予約が入っています']
      }
    end
  end
end
