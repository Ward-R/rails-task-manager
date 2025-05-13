class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # when it saves -> go to the restaurants show page
      redirect_to task_path(@task)
    else
      # when it doesnt save -> show the form again
      render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def task_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:task).permit(:title, :details)
  end
end
