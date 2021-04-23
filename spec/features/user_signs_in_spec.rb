require 'rails_helper'

feature 'Employee signs in' do
  let!(:employee) { create(:employee, email: "employee@example.com", password: "password") }

  scenario 'they see the meters index page' do
    visit new_user_session_path

    fill_in "Email", with: "employee@example.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    expect(page).to have_content "Meters"
  end
end

feature 'Manager signs in' do
  let!(:manager) { create(:manager, email: "manager@example.com", password: "password") }

  scenario 'they see the meters index page' do
    visit new_user_session_path

    fill_in "Email", with: "manager@example.com"
    fill_in "Password", with: "password"

    click_button "Log in"

    expect(page).to have_content "Meters"
  end
end
