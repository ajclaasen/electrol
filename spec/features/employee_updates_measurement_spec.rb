require 'rails_helper'

feature 'Employee updates a measurement in a meter' do
  let(:employee) { create(:employee) }
  let(:meter) { create(:meter, :with_measurement) }

  scenario 'they see the updated measurement on the page' do
    sign_in employee

    visit meter_path(meter)

    page.find('h3', text: "Measurements").find(:xpath, "..").first("input[type='number']")
      .fill_in with: "1234"

    click_button "Save"

    visit meter_path(meter)

    expect(page).to have_xpath("//input[@value='1234.0']")
  end
end
