require "rails_helper"

feature "Users" do
  scenario "index" do
    User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

    visit root_path
    click_on "Users"

    expect(page).to have_content("Users")
    expect(page).to have_content("John")
    expect(page).to have_content("Smith")
    expect(page).to have_content("email@smithy.com")
  end

  feature "Creating a User" do
    scenario "new page" do
      visit root_path
      click_on "Users"
      click_on "New User"

      expect(page).to have_content("New User")
      expect(page).to have_content("First name")
      expect(page).to have_content("Last name")
      expect(page).to have_content("Email")
      expect(page).to have_button("Create User")
      expect(page).to have_link("cancel")
    end

    scenario "create" do
      visit root_path
      click_on "Users"
      click_on "New User"

      fill_in "First name", with: "John"
      fill_in "Last name", with: "Smith"
      fill_in "Email", with: "email@smithy.com"
      click_on("Create User")

      expect(page).to have_content("Users")
      expect(page).to have_content("John")
      expect(page).to have_content("Smith")
      expect(page).to have_content("email@smithy.com")
    end
  end

  feature "Editing Users" do
    scenario "edit view" do
      User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

      visit root_path
      click_on "Users"
      click_on "edit"

      expect(page).to have_content("Edit User")
      expect(find_field("First name").value).to eq("John")
      expect(find_field("Last name").value).to eq("Smith")
      expect(find_field("Email").value).to eq("email@smithy.com")
      expect(page).to have_button("Update User")
    end

    scenario "update" do
      User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

      visit root_path
      click_on "Users"
      click_on "edit"

      fill_in "First name", with: "Johnny"
      fill_in "Last name", with: "Smit"
      fill_in "Email", with: "email@smithy.net"
      click_on("Update User")

      expect(page).to have_content("Users")
      expect(page).to have_content("Johnny")
      expect(page).to have_content("Smit")
      expect(page).to have_content("email@smithy.net")
    end
  end

  scenario "delete" do
    User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

    visit root_path
    click_on "Users"
    click_on "edit"
    click_on "Delete User"

    expect(page).to have_content("Users")
    expect(page).to have_no_content("John")
    expect(page).to have_no_content("Smith")
    expect(page).to have_no_content("email@smithy.com")
  end

  scenario "show view" do
    User.create!(first_name: "John", last_name: "Smith", email: "email@smithy.com")

    visit root_path
    click_on "Users"
    click_on "John Smith"

    expect(page).to have_content("John")
    expect(page).to have_content("Smith")
    expect(page).to have_content("email@smithy.com")
  end
end
