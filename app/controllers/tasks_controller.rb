class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks

    if params[:filter_completed] == "true"
      @tasks = @tasks.where(completed: false)
      @active_link = "Incomplete"
    else
      @active_link = "All"
    end

    direction = {
      "desc" => :desc,
      "asc" => :asc,
      nil => :desc,
    }[params[:direction]]

    @tasks = {
      "description" => @tasks.order(description: direction),
      "due_date" => @tasks.order(due_date: direction),
      "completed" => @tasks.order(completed: direction),
      nil => @tasks
    }[params[:order_by]]
  end

  def show

  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    if @task.update(task_params)
      redirect_to [@project, @task], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path, notice: 'Task was successfully destroyed.'
  end

  def export
    tasks = Task.all
    csv_data_output = []

    csv_headers = tasks.first.attributes.map {|key, v| key.to_s}
    csv_data_output.push(csv_headers.join(", "))

    tasks.each do |task|
      csv_line = task.attributes.map {|k, value| value}
      csv_data_output.push(csv_line.join(", "))
    end

    send_data csv_data_output.join("\n"), :filename => "exported_tasks.csv"
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :due_date, :completed)
    end
end
