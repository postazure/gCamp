require "rails_helper"

feature "Tasks" do
  feature "#index" do
    scenario "show tasks of a project" do
      test_project = Project.create!(name: "Test Project")
      Task.create!(description: "Test Task", project_id: test_project.id)

      visit root_path
      click_on "projects-footer-action"
      click_on "project#{test_project.id}-show-action"
      click_on "task-index-action"

      expect(page).to have_content("Test Task")
      expect(page.current_path).to eq(project_tasks_path(test_project))
    end

    scenario "do not show tasks of other projects" do
      test_project1 = Project.create!(name: "Test Project 1")
      test_project2 = Project.create!(name: "Test Project 2")
      Task.create!(description: "Test Task 1", project_id: test_project1.id)
      Task.create!(description: "Test Task 2", project_id: test_project2.id)

      visit root_path
      click_on "projects-footer-action"
      click_on "project#{test_project1.id}-show-action"
      click_on "task-index-action"

      expect(page).to have_content("Test Task 1")
      expect(page).to have_no_content("Test Task 2")
      expect(page.current_path).to eq(project_tasks_path(test_project1))
    end
  end

  scenario "#new" do
    test_project = Project.create!(name: "Test Project")

    visit root_path
    click_on "projects-footer-action"
    click_on "project#{test_project.id}-show-action"
    click_on "task-index-action"
    click_on "new-task-action"
    fill_in "task-description-field", with: "My New Task"
    click_on "submit-task-action"
    click_on "task-index-action"

    expect(page).to have_content("My New Task")
    expect(page.current_path).to eq(project_tasks_path(test_project))
  end

  scenario "#edit" do
    test_project = Project.create!(name: "Test Project")
    test_task = Task.create!(description: "Test Task", project_id: test_project.id)

    visit root_path
    click_on "projects-footer-action"
    click_on "project#{test_project.id}-show-action"
    click_on "task-index-action"
    click_on "edit-task#{test_task.id}-action"
    fill_in "task-description-field", with: "My New Task"
    click_on "submit-task-action"
    click_on "task-index-action"

    expect(page).to have_content("My New Task")
    expect(page).to have_no_content("Test Task")
    expect(page.current_path).to eq(project_tasks_path(test_project))
  end

  scenario "#delete" do
    test_project = Project.create!(name: "Test Project")
    test_task = Task.create!(description: "Test Task", project_id: test_project.id)

    visit root_path
    click_on "projects-footer-action"
    click_on "project#{test_project.id}-show-action"
    click_on "task-index-action"
    click_on "destroy-task#{test_task.id}-action"

    expect(page).to have_no_content("Test Task")
    expect(page.current_path).to eq(project_tasks_path(test_project))
  end

  scenario "#show" do
    test_project = Project.create!(name: "Test Project")
    test_task = Task.create!(description: "Test Task", project_id: test_project.id)

    visit root_path
    click_on "projects-footer-action"
    click_on "project#{test_project.id}-show-action"
    click_on "task-index-action"
    click_on "show-task#{test_task.id}-action"

    expect(page).to have_content("Test Task")
    expect(page.current_path).to eq(project_task_path(test_project, test_task))
  end
end
