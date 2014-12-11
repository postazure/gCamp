require "rails_helper"

feature "Tasks" do
  scenario "index" do
    Task.create!(description: "Test Task")

    visit root_path
    click_on "tasks-footer-action"

    expect(page).to have_content("Test Task")
    expect(page.current_path).to eq(tasks_path)
  end

  feature "Creating Tasks" do
    scenario "new view" do
      visit root_path
      click_on "tasks-footer-action"

      click_on "new-task-action"
      expect(page.current_path).to eq(new_task_path)
    end

    scenario "create" do
      visit root_path
      click_on "tasks-footer-action"
      click_on "new-task-action"
      fill_in "task-description-field", with: "My New Task"
      click_on "submit-task-action"

      expect(page).to have_content("My New Task")
    end
  end

  feature "Editing Tasks" do
    scenario "edit view" do
      test_task = Task.create!(description: "Edit Me")

      visit root_path
      click_on "tasks-footer-action"
      click_on "edit-task#{test_task.id}-action"

      expect(find_field("task-description-field").value).to eq("Edit Me")
      expect(page.current_path).to eq(edit_task_path(test_task))
    end

    scenario "update" do
      test_task = Task.create!(description: "Edit Me")

      visit root_path
      click_on "tasks-footer-action"
      click_on "edit-task#{test_task.id}-action"
      fill_in "task-description-field", with: "I've been updated"
      click_on "submit-task-action"

      expect(page).to have_content("I've been updated")
      expect(page.current_path).to eq(task_path(test_task))
    end
  end

  scenario "delete" do
    test_task = Task.create!(description: "Delete Me")

    visit root_path
    click_on "tasks-footer-action"
    click_on "destroy-task#{test_task.id}-action"

    expect(page).to have_no_content("Delete Me")
  end

  scenario "#show" do
    test_task = Task.create!(description: "Show Me")

    visit root_path
    click_on "tasks-footer-action"
    click_on "show-task#{test_task.id}-action"

    expect(page).to have_content("Show Me")
  end
end
