require 'rails_helper'
feature "User creates a message" do
  scenario "successfully creates a new message" do
    visit new_user_path
    fill_in "content", with: "Hello everyone how is your day? Bad? Too bad!"
    click_button "Submit"
    expect(page).to have_content "Message successfully created"
  end
end