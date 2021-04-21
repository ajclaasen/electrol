require 'rails_helper'

RSpec.describe "meters/new", type: :view do
  before(:each) do
    assign(:meter, build(:meter))
  end

  it "renders new meter form" do
    render

    assert_select "form[action=?][method=?]", meters_path, "post" do

      assert_select "input[name=?]", "meter[name]"

      assert_select "input[name=?]", "meter[interval]"

      assert_select "input[name=?]", "meter[unit]"
    end
  end
end
