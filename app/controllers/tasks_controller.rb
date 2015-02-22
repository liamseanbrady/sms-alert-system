class TasksController < AppliationController
  before_action :require_user

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Your task was successfully created'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'The task could not be created'
      render :new
    end
  end

  private

  def task_params
    params.require(:task).require(:phone_number, :phrase, :recipient)
  end
end
