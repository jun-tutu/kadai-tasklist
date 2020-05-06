class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.all
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に追加されました.'
      redirect_to root_url
      
    else
      flash[:danger] = 'Taskの追加に失敗しました.'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に更新されました.'
      redirect_to @task
    else
      flash[:danger] = 'Taskの更新に失敗しました.'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'Taskが正常に削除されました.'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
