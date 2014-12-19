require "rails_helper"

feature "authorization" do
  feature "registrations#new" do
    it "register with valid info" do
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

    it "register with invalid info" do
      visit root_path
      click_on "user-registration-action"
      # fill_in :user_first_name, with: "John"
      # fill_in :user_last_name, with: "Smith"
      fill_in :user_email, with: "g@g.com"
      fill_in :user_password, with: "abc123"
      # fill_in :user_password_confirmation, with: "abc123"
      click_on "submit-user"

      expect(page).to have_content("errors prohibited")
      expect(page.current_path).to eq(signup_path)
    end
  end
end
