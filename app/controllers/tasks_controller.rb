class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:completed] == "true"
      @tasks = Task.where(completed: params[:completed])
      @active_link = "Incomplete"
    else
      @tasks = Task.all
      @active_link = "All"
    end
  end

  def show

  end

  def new
    @task = Task.new
  end

  def edit

  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
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
