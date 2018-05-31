class ProjectsController < ApplicationController
  before_action :set_project, only: :show
  def index
    @q = Project.published_projects.ransack(query_params)
    @projects = @q.result
  end

  def show; end

  private

    def set_project
      @project = Project.find(params[:id])
    end
end
