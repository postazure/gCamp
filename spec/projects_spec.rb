require "rails_helper"

feature "Projects" do
  scenario "index" do
    Project.create!(name: "My Test Project")

    visit root_path
    click_on  "projects-footer-action"

    expect(page.current_path).to eq(projects_path)
  end

  feature "Creating a Project" do
    scenario "new page" do
      visit root_path
      click_on "projects-footer-action"
      click_on "new-project-action"

      expect(page.current_path).to eq(new_project_path)
    end

    scenario "create" do
      visit root_path
      click_on "projects-footer-action"
      click_on "new-project-action"
      fill_in "project-name-field", with: "My Test Project"
      click_on "submit-project-action"

      expect(page).to have_content("My Test Project")
    end
  end

  feature "Editing Project" do
    scenario "edit page" do
      test_project = Project.create!(name: "My Test Project")

      visit root_path
      click_on "projects-footer-action"
      click_on "My Test Project"
      click_on "edit-project-action"

      expect(page.current_path).to eq(edit_project_path(test_project))
    end

    scenario "update" do
      test_project = Project.create!(name: "My Test Project")

      visit root_path
      click_on "projects-footer-action"
      click_on "My Test Project"
      click_on "edit-project-action"
      fill_in "project-name-field", with: "Project Updated"
      click_on "submit-project-action"

      expect(page).to have_content("Project Updated")
      expect(page.current_path).to eq(project_path(test_project))
    end
  end

  scenario "delete" do
    Project.create!(name: "My Test Project")

    visit root_path
    click_on "projects-footer-action"
    click_on "My Test Project"
    click_on "delete-project-action"

    expect(page).to have_no_content("My Test Project")
    expect(page.current_path).to eq(projects_path)
  end

  scenario "show" do
    test_project = Project.create!(name: "My Test Project")

    visit root_path
    click_on "projects-footer-action"
    click_on "My Test Project"

    expect(page.current_path).to eq(project_path(test_project))
  end
end
