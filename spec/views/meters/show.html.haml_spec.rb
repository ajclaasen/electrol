require 'rails_helper'

RSpec.describe "meters/show", type: :view do
  before(:each) do
    @meter = assign(:meter, create(:meter))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Interval/)
    expect(rendered).to match(/Unit/)
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
