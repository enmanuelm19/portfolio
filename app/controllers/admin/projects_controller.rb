class Admin::ProjectsController < Admin::AdminController
  before_action :set_project, only: %i[edit update destroy show]
  def index
    @q = Project.search(query_params)
    @projects = @q.result.page(params[:page])
  end

  def new
    @project = Project.new
  end

  def edit; end

  def show; end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to admin_projects_path, notice: 'El proyecto ha sido creado satisfactoriamente'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: 'El proyecto ha sido editado satisfactoriamente'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: 'El proyecto ha sido eliminado satisfactoriamente'
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :user_id, :published, :header_image, :locale)
    end
end
