class TasksController < AppliationController
  def new
    @task = Task.new
  end
end
