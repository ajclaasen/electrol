require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:measurement) { build(:measurement) }

  subject { measurement }

  describe "when it has a parent meter" do
    before { measurement.meter = create(:meter) }

    it { is_expected.to be_valid }
  end

  describe "when it does not have a parent meter" do
    before { measurement.meter = nil }

    it { is_expected.to_not be_valid }
  end

  describe "when it has been approved" do
    let(:measurement) { create(:measurement, :approved) }

    describe "and the amount is changed" do
      before { measurement.amount = measurement.amount + 1 }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#start" do
    let(:meter) { create(:meter, start: Date.today, finish: Date.today + 2.weeks, interval: 1.week) }

    subject { measurement.start }

    describe "when it is the first measurement" do
      let(:measurement) { meter.measurements.first }

      it { is_expected.to eq Date.today }
    end

    describe "when it is the second measurement" do
      let(:measurement) { meter.measurements.second }

      it { is_expected.to eq Date.today + 1.week }
    end
  end

  describe "#finish" do
    let(:meter) { create(:meter, start: Date.today, finish: Date.today + 2.weeks, interval: 1.week) }

    subject { measurement.finish }

    describe "when it is the first measurement" do
      let(:measurement) { meter.measurements.first }


      it { is_expected.to eq Date.today + 1.week }
    end

    describe "when it is the second measurement" do
      let(:measurement) { meter.measurements.second }

      it { is_expected.to eq Date.today + 2.weeks }
    end
  end
end
