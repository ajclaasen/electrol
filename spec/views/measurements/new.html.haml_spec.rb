require 'rails_helper'

RSpec.describe "measurements/new", type: :view do
  before(:each) do
    assign(:measurement, Measurement.new(
      meter: nil,
      amount: "9.99"
    ))
  end

  it "renders new measurement form" do
    render

    assert_select "form[action=?][method=?]", measurements_path, "post" do

      assert_select "input[name=?]", "measurement[meter_id]"

      assert_select "input[name=?]", "measurement[amount]"
    end
  end
end
