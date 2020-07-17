require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should belong_to(:user) }
      it { should belong_to(:schedule) }
    end
  end
end
