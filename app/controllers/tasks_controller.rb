class TasksController < ApplicationController
  before_action :require_admin, only: [:index]
  
  def index
    @tasks = Task.all
    respond_to do |format|
      format.csv { render text: Task.to_csv } 
    end
  end

  def completed
    @task = Task.find(params[:id])

    if @task.update(completed_at: Time.now)
      flash[:notice] = "The task was marked as completed"
    else
      flash[:error] = "Task could not be marked as completed. Please try again."
    end

    redirect_to user_path(current_user)
  end
end
