require "rails_helper"

feature "authorization" do
  it "nav to registration page" do
    visit root_path
    click_on "user-registration-action"

    expect(page.current_path).to eq(signup_path)
  end

  it "register a user" do
    visit root_path
    click_on "user-registration-action"
    fill_in :user_first_name, with: "John"
    fill_in :user_last_name, with: "Smith"
    fill_in :user_email, with: "g@g.com"
    fill_in :user_password, with: "abc123"
    fill_in :user_password_confirmation, with: "abc123"
    

    click_on "submit-user"

    expect(page).to have_content("Sign Out")
  end
end
