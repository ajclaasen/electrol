require 'rails_helper'

RSpec.describe Meter, type: :model do
  let(:start) { Date.yesterday }
  let(:finish) { Date.tomorrow }
  let(:interval) { 1.month }
  
  describe "validations" do
    subject { build(:meter, start: start, finish: finish, interval: interval) }

    describe "when the finish is before the start" do
      let(:start) { Date.today }
      let(:finish) { Date.yesterday }

      it { is_expected.to be_invalid }
    end

    describe "when the finish is equal to the start" do
      let(:start) { Date.today }
      let(:finish) { Date.today }

      it { is_expected.to be_invalid }
    end

    describe "when the finish is after the start" do
      let(:start) { Date.today }
      let(:finish) { Date.tomorrow }

      it { is_expected.to be_valid }
    end
  end



  describe "#measurements.count" do
    let(:meter) { create(:meter, start: start, finish: finish, interval: interval) }

    subject { meter.measurements.count }

    describe "when the interval is 0" do
      let(:interval) { 0.days }

      it { is_expected.to eq 0 }
    end

    describe "when the finish is 8 days from the start" do
      let(:start) { Date.today }
      let(:finish) { 8.days.from_now }

      describe "when the interval is 1 day" do
        let(:interval) { 1.day }

        it { is_expected.to eq 8 }
      end

      describe "when the interval is 1 week (7 days)" do
        let(:interval) { 1.week }
        
        it { is_expected.to eq 2 }
      end
    end

    describe "when the meter is from non-leap february to end of march" do
      let(:start) { Date.parse("Feb 1 2021") }
      let(:finish) { Date.parse("Mar 31 2021") }

      describe "with a 1 day interval" do
        let(:interval) { 1.day }
        
        it { is_expected.to eq 58 }
      end

      describe "with a 1 month interval" do
        let(:interval) { 1.month }

        it { is_expected.to eq 2 }
      end

      # It is assumed that if non-leap year february works, leap years will also be accounted for by the framework
    end
  end
end
