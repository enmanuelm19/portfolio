class Admin::ExperimentsController < Admin::AdminController
  before_action :set_experiment, only: %i[edit update destroy show]

  def index
    @q = Experiment.ransack(query_params)
    @experiments = @q.result.includes(:user).page(params[:page])
  end

  def edit; end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.user_id = current_user.id
    if @experiment.save
      redirect_to admin_experiments_path, notice: 'Experimento creado satisfactoriamente'
    else
      render :new
    end
  end

  def update
    if @experiment.update(experiment_params)
      redirect_to admin_experiments_path, notice: 'Experimento creado satisfactoriamente'
    else
      render :edit
    end
  end

  def destroy
    @experiment.destroy
    redirect_to admin_experiments_path, notice: 'Experimento eliminado satisfactoriamente'
  end

  private

    def set_experiment
      @experiment = Experiment.friendly.find(params[:id])
    end

    def experiment_params
      params.require(:experiment).permit(:title, :wrapper, :component, :code_reference, :user_id, :published)
    end
end
