require 'rails_helper'

RSpec.describe "measurements/new", type: :view do
  before(:each) do
    assign(:measurement, build(:measurement))
  end

  it "renders new measurement form" do
    render

    assert_select "form[action=?][method=?]", measurements_path, "post" do

      assert_select "input[name=?]", "measurement[amount]"
    end
  end
end
