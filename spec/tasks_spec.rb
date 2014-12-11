require "rails_helper"

feature "Tasks" do
  scenario "index" do
    Task.create!(description: "Task A")
    Task.create!(description: "Task B")
    Task.create!(description: "Task C")

    visit root_path
    click_on "Tasks"

    expect(page).to have_content("Task A")
    expect(page).to have_content("Task B")
    expect(page).to have_content("Task C")
  end

  feature "Creating Tasks" do
    scenario "new view" do
      visit root_path
      click_on "Tasks"

      click_on "New Task"
      expect(page).to have_content("New task")
      expect(page).to have_content("Description")
      expect(page).to have_content("Due date")
    end

    scenario "create" do
      visit root_path
      click_on "Tasks"
      click_on "New Task"
      fill_in "Description", with: "My New Task"
      click_on "Create Task"

      expect(page).to have_content("My New Task")
    end
  end

  feature "Editing Tasks" do
    scenario "edit view" do
      Task.create!(description: "Edit Me")

      visit root_path
      click_on "Tasks"
      click_on "Edit"

      expect(page).to have_content("Editing task")
      expect(find_field("Description").value).to eq("Edit Me")
      expect(page).to have_content("Due date")
    end

    scenario "update" do
      Task.create!(description: "Edit Me")

      visit root_path
      click_on "Tasks"
      click_on "Edit"
      fill_in "Description", with: "I've been updated"
      click_on "Update Task"

      expect(page).to have_content("I've been updated")
    end
  end

  scenario "delete" do
    Task.create!(description: "Delete Me")

    visit root_path
    click_on "Tasks"
    click_on "Destroy"

    expect(page).to have_no_content("Delete Me")
  end

  scenario "#show" do
    Task.create!(description: "Show Me")

    visit root_path
    click_on "Tasks"
    click_on "Show"

    expect(page).to have_content("Show Me")
  end
end
