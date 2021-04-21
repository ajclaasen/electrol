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
end
