require 'rails_helper'

RSpec.describe "meters/show", type: :view do
  before(:each) do
    @meter = assign(:meter, Meter.create!(
      name: "Name",
      interval: "Interval",
      unit: "Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Interval/)
    expect(rendered).to match(/Unit/)
  end
end
