class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create_project
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'プロジェクトが追加されました'
      #redirect_to @task
      redirect_to controller: 'tasks', action: 'home'
    else
      flash[:danger] = 'プロジェクトが追加されません'
      render :new
    end
  end

  def edit_project
    @project = Project.find(params[:id])
  end

  def update_project
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to controller: 'tasks', action: 'home'
  end

  def destroy_project
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'プロジェクトが削除されました'
    redirect_to root_path
  end

  def project_params
  params.require(:project).permit(:name)
end

end
