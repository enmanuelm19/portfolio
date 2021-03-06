class ProjectsController < ApplicationController
  before_action :set_project, only: :show
  def index
    @q = Project.send(locale_param).published_projects.ransack(query_params)
    @projects = @q.result.page(params[:page])
  end

  def show; end

  private

    def set_project
      @project = Project.find(params[:id])
    end
end
