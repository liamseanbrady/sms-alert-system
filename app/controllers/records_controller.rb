class RecordsController < ApplicationController
  before_action :require_user
 
  def generate
    branch_id = current_user.branch? ? current_user.id : nil
    respond_to do |format|
      format.csv { render text: Task.to_csv(branch_id) }
    end
  end
end
