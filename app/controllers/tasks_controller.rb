class TasksController < ApplicationController

  def home
    @project = Project.all
    @tasks = Task.all.order(limit_date: "ASC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクが追加されました'
      #redirect_to @task
      redirect_to controller: 'tasks', action: 'home'
    else
      flash[:danger] = 'タスクが追加されません'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to controller: 'tasks', action: 'home'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'タスクが削除されました'
    redirect_to root_path
  end

  def task_params
  params.require(:task).permit(:content, :limit_date, :project_id)
end

end
