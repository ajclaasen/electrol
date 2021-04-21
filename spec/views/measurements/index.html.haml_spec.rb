require 'rails_helper'

RSpec.describe "measurements/index", type: :view do
  before(:each) do
    assign(:measurements, create_list(:measurement, 2))
  end

  it "renders a list of measurements" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
