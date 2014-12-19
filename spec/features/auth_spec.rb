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
      expect(page.current_path).to eq(root_path)
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

  feature AuthenticationController do
    feature "signin" do
      scenario "sign in with valid login" do
        test_user = User.create!(
          first_name: "Buster",
          last_name: "Bluth",
          email:"buster@bluthcompany.com",
          password:"the blue is land",
          password_confirmation:"the blue is land",
        )

        visit root_path
        click_on "user-signin-action"
        fill_in :email, with: "buster@bluthcompany.com"
        fill_in :password, with: "the blue is land"
        click_on "submit-user"

        expect(page).to have_content("Sign Out")
        expect(page).to have_no_content("Sign In")
        expect(page.current_path).to eq(root_path)
      end

      scenario "sign in with invalid login" do
        visit root_path
        click_on "user-signin-action"
        fill_in :email, with: "gob@bluthcompany.com"
        fill_in :password, with: "Ive made a horrible mistake"
        click_on "submit-user"

        expect(page).to have_content("Username / password combination is invalid")
        expect(page).to have_content("Sign In")
        expect(page).to have_no_content("Sign Out")
        expect(page.current_path).to eq(signin_path)
      end
    end
  end
end
