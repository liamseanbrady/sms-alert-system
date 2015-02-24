class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_same_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'You created a new user'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new  
    end
  end
  
  def show
    if current_user.role == 'branch'
      @tasks = current_user.uncompleted_tasks
    else
      @tasks = Task.all.where(completed_at: nil)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :role, :phone_number, :password)
  end

  def set_user
    @user = User.find_by(slug: params[:id]) 
  end

  def require_same_user
    unless logged_in? && @user == current_user
      flash[:error] = "Sorry. You're not allowed to do that."
      redirect_to root_path
    end
  end
end
