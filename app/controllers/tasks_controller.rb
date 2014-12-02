class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:completed]
      @tasks = Task.where(completed: false)
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
    working_array = []
    compile_string = ""
    tasks.first.attributes.each do |key, value|
      compile_string = compile_string + "#{key.to_s}, "
    end
    working_array.push(compile_string)


    tasks.each do |task|
      compile_string = ""
      task.attributes.each do |key, value|
        compile_string = compile_string + "#{value}, "
      end
      working_array.push(compile_string)
    end
    send_data working_array.join("\n"), :filename => "tasks.csv"
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :due_date, :completed)
    end
end
