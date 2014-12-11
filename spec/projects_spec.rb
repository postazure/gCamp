require "rails_helper"

feature "Projects" do
  scenario "index" do
    Project.create!(name: "My Test Project")

    visit root_path
    click_on  "Projects"

    expect(page.current_path).to eq(projects_path)
  end

  feature "Creating a Project" do
    scenario "new page" do
      visit root_path
      click_on "Projects"
      click_on "New Project"

      expect(page.current_path).to eq(new_project_path)
    end

    scenario "create" do
      visit root_path
      click_on "Projects"
      click_on "New Project"
      fill_in "Name", with: "My Test Project"
      click_on "Create Project"

      expect(page).to have_content("My Test Project")
    end
  end

  feature "Editing Project" do
    scenario "edit page" do
      test_project = Project.create!(name: "My Test Project")

      visit root_path
      click_on "Project"
      click_on "My Test Project"
      click_on "Edit"

      expect(page.current_path).to eq(edit_project_path(test_project))
    end

    scenario "update" do
      test_project = Project.create!(name: "My Test Project")

      visit root_path
      click_on "Project"
      click_on "My Test Project"
      click_on "Edit"
      fill_in "Name", with: "Project Updated"
      click_on "Update Project"

      expect(page).to have_content("Project Updated")
      expect(page.current_path).to eq(project_path(test_project))
    end
  end

  scenario "delete" do
    Project.create!(name: "My Test Project")

    visit root_path
    click_on "Project"
    click_on "My Test Project"
    click_on "Delete"

    expect(page).to have_no_content("My Test Project")
    expect(page.current_path).to eq(projects_path)
  end

  scenario "show" do
    test_project = Project.create!(name: "My Test Project")

    visit root_path
    click_on "Project"
    click_on "My Test Project"

    expect(page.current_path).to eq(project_path(test_project))
  end
end
