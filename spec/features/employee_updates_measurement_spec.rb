require 'rails_helper'

feature 'Employee attempts to update a measurement' do
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

  describe "when the measurement has been approved" do
    let(:meter) { create(:meter, :with_approved_measurement) }

    scenario "they can't update it" do
      sign_in employee

      visit meter_path(meter)

      expect(page.find('h3', text: "Measurements").find(:xpath, "..")
        .first("input[type='number']")).to be_disabled
    end
  end
end
