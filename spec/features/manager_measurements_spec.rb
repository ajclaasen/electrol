require 'rails_helper'

feature "Manager views a meter" do
  let(:manager) { create(:manager) }
  let(:meter) { create(:meter, :with_measurement) }

  scenario "they can't update the measurements" do
    sign_in manager

    visit meter_path(meter)

    expect(page.find('h3', text: "Measurements").find(:xpath, "..")
      .first("input[type='number']")).to be_disabled
  end
end
