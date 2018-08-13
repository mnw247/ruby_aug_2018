require 'rails_helper'
feature "guest user creates an account" do
  scenario "successfully creates a new user account" do
    visit new_user_path
    fill_in "user[username]", with: "stephendecker"
    click_button "Sign in"
    expect(page).to have_content "User successfully created"
  end
end