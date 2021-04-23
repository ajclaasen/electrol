require 'rails_helper'

feature 'Employee creates a meter' do
  let(:employee) { create(:employee) }

  scenario 'they see the meter attributes on the page' do
    sign_in employee

    visit new_meter_path

    fill_in "Name", with: "NewMeter"
    
    find("#meter_start_1i").select "2020"
    find("#meter_finish_1i").select "2021"

    select "Months", from: "Interval"

    fill_in "Unit", with: "kWh"

    click_button "Save"

    expect(page).to have_content "NewMeter"
    expect(page).to have_selector "input[type='number']"
  end
end
