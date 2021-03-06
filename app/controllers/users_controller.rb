class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_same_user, only: [:show]
  before_action :require_admin, only: [:index]

  def index
    @branches = User.branches
  end

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
  
  def edit
    @user = User.find_by(slug: params[:id]) 
  end

  def update
    @user = User.find_by(slug: params[:id])

    if @user.update(user_params)
      flash[:notice] = 'You successfully update your details'
      redirect_to user_path(@user)
    else
      render :edit
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
