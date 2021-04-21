require 'rails_helper'

RSpec.describe "meters/index", type: :view do
  before(:each) do
    assign(:meters, create_list(:meter, 2))
  end

  it "renders a list of meters" do
    render
    assert_select "tr>td", text: "MyString".to_s, count: 2
    assert_select "tr>td", text: "M".to_s, count: 2
    assert_select "tr>td", text: "kWh".to_s, count: 2
  end
end
