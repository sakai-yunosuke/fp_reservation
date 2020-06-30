require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:start_time) }
      it { should belong_to(:user) }
    end

    context 'with date in the past' do
      let(:schedule){ build(:schedule, :in_the_past) }
      it { expect(schedule).not_to be_valid }
    end

    context 'with time not every half hour' do
      let(:schedule){ build(:schedule, :not_every_half_hour) }
      it { expect(schedule).not_to be_valid }
    end

    context 'with early time on weekday' do
      let(:schedule){ build(:schedule, :too_early_on_weekday) }
      it { expect(schedule).not_to be_valid }
    end

    context 'with late time on weekday' do
      let(:schedule){ build(:schedule, :too_late_on_weekday) }
      it { expect(schedule).not_to be_valid }
    end

    context 'with early time on saturday' do
      let(:schedule){ build(:schedule, :too_early_on_saturday) }
      it { expect(schedule).not_to be_valid }
    end

    context 'with late time on saturday' do
      let(:schedule){ build(:schedule, :too_late_on_saturday) }
      it { expect(schedule).not_to be_valid }
    end

    context 'on sunday' do
      let(:schedule){ build(:schedule, :on_sunday) }
      it { expect(schedule).not_to be_valid }
    end
  end
end
