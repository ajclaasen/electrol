require 'rails_helper'

RSpec.describe "measurements/index", type: :view do
  before(:each) do
    assign(:measurements, [
      Measurement.create!(
        meter: nil,
        amount: "9.99"
      ),
      Measurement.create!(
        meter: nil,
        amount: "9.99"
      )
    ])
  end

  it "renders a list of measurements" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
