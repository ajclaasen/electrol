require 'rails_helper'

RSpec.describe "measurements/show", type: :view do
  before(:each) do
    @measurement = assign(:measurement, create(:measurement))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
