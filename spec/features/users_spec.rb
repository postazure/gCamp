require "rails_helper"

feature "Users" do
  scenario "index" do
    User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "email@smithy.com"
    )

    visit root_path
    click_on "users-footer-action"

    expect(page).to have_content("John")
    expect(page).to have_content("Smith")
    expect(page).to have_content("email@smithy.com")
    expect(page.current_path).to eq(users_path)
  end

  feature "Creating a User" do
    scenario "new page" do
      visit root_path
      click_on "users-footer-action"
      click_on "new-user-action"

      expect(page.current_path).to eq(new_user_path)
    end

    scenario "create" do
      visit root_path
      click_on "users-footer-action"
      click_on "new-user-action"

      fill_in "first-name-field", with: "John"
      fill_in "last-name-field", with: "Smith"
      fill_in "email-field", with: "email@smithy.com"
      click_on("submit-user-action")

      expect(page).to have_content("Users")
      expect(page).to have_content("John")
      expect(page).to have_content("Smith")
      expect(page).to have_content("email@smithy.com")
    end

    scenario "displays errors" do
      visit root_path
      click_on "users-footer-action"
      click_on "new-user-action"
      click_on "submit-user-action"

      expect("error_explanation").to be_present
    end
  end

  feature "Editing Users" do
    scenario "edit view from index" do
      test_user = User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

      visit root_path
      click_on "users-footer-action"
      click_on "edit-user#{test_user.id}-action"

      expect(find_field("first-name-field").value).to eq("John")
      expect(find_field("last-name-field").value).to eq("Smith")
      expect(find_field("email-field").value).to eq("email@smithy.com")
      expect(page.current_path).to eq(edit_user_path(test_user))
    end

    scenario "update" do
      test_user = User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

      visit root_path
      click_on "users-footer-action"
      click_on "edit-user#{test_user.id}-action"

      fill_in "first-name-field", with: "Johnny"
      fill_in "last-name-field", with: "Smit"
      fill_in "email-field", with: "email@smithy.net"
      click_on("submit-user-action")

      expect(page).to have_content("Users")
      expect(page).to have_content("Johnny")
      expect(page).to have_content("Smit")
      expect(page).to have_content("email@smithy.net")
      expect(page.current_path).to eq(users_path)
    end

    scenario "displays errors" do
      test_user = User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

      visit root_path
      click_on "users-footer-action"
      click_on "edit-user#{test_user.id}-action"
      fill_in "first-name-field", with: ""
      fill_in "last-name-field", with: ""
      fill_in "email-field", with: ""
      click_on("submit-user-action")

      expect("error_explanation").to be_present
    end
  end

  scenario "delete" do
    test_user = User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

    visit root_path
    click_on "users-footer-action"
    click_on "edit-user#{test_user.id}-action"
    click_on "delete-user-action"

    expect(page).to have_no_content("John")
    expect(page).to have_no_content("Smith")
    expect(page).to have_no_content("email@smithy.com")
    expect(page.current_path).to eq(users_path)
  end

  scenario "show view" do
    test_user = User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

    visit root_path
    click_on "users-footer-action"
    click_on "John Smith"

    expect(page).to have_content("John")
    expect(page).to have_content("Smith")
    expect(page).to have_content("email@smithy.com")
    expect(page.current_path).to eq(user_path(test_user))
  end
end
