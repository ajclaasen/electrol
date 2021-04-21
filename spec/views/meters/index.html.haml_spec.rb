require 'rails_helper'

RSpec.describe "meters/index", type: :view do
  before(:each) do
    assign(:meters, [
      Meter.create!(
        name: "Name",
        interval: "Interval",
        unit: "Unit"
      ),
      Meter.create!(
        name: "Name",
        interval: "Interval",
        unit: "Unit"
      )
    ])
  end

  it "renders a list of meters" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Interval".to_s, count: 2
    assert_select "tr>td", text: "Unit".to_s, count: 2
  end
end
