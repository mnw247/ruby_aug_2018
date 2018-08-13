require 'rails_helper'
feature "guest user creates an account" do
  scenario "successfully creates a new user account" do
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "chang"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "User successfully created"
  end
end