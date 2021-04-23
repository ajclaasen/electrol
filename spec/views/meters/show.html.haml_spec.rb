require 'rails_helper'

RSpec.describe "meters/show", type: :view do
  before(:each) do
    @meter = assign(:meter, create(:meter, name: "MName", interval: 8.days, unit: "MUnit"))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/MName/)
    expect(rendered).to match(/8 days/)
    expect(rendered).to match(/MUnit/)
  end

  describe "when it has a measurement" do
    before(:each) do
      @measurement = build(:measurement, amount: "1234")
      @measurement.meter = @meter
      @measurement.save
    end

    it "renders the measurement's attributes" do
      render
      expect(rendered).to match(/1234/)
    end
  end
end
