class PagesController < ApplicationController
  #def all
    #@project = Project.all
    #@tasks = Task.all.order(limit_date: "ASC")
  #end

  def by_project
    @p_id = params[:id]
    @project = Project.all
    @tasks = Task.where(project_id:@p_id).order(limit_date: "ASC")
  end

end
