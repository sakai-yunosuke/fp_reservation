require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should belong_to(:user) }
      it { should belong_to(:schedule) }
    end

    context 'when double booking' do
      let(:user){ create(:user) }
      let(:reservations){ create_list(:reservation, 2, user: user) }

      # ユーザーIDが同一のものか確かめるために2つ実行している
      it { expect(reservations[0]).not_to be_valid }
      it { expect(reservations[1]).not_to be_valid }
    end
  end
end
