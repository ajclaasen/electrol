require 'rails_helper'

RSpec.describe "meters/edit", type: :view do
  before(:each) do
    @meter = assign(:meter, Meter.create!(
      name: "MyString",
      interval: "MyString",
      unit: "MyString"
    ))
  end

  it "renders the edit meter form" do
    render

    assert_select "form[action=?][method=?]", meter_path(@meter), "post" do

      assert_select "input[name=?]", "meter[name]"

      assert_select "input[name=?]", "meter[interval]"

      assert_select "input[name=?]", "meter[unit]"
    end
  end
end
