class TasksController < ApplicationController
  before_action :require_admin
  
  def index
    @tasks = Task.all
    respond_to do |format|
      format.csv { render text: Task.to_csv } 
    end
  end
end
