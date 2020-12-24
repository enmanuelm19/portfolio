class Playground::ExperimentsController < ApplicationController
  before_action :set_experiment, only: :show

  def index
    @q = Experiment.published_experiments.ransack(query_params)
    @experiments = @q.result.page(params[:page])
  end

  def show; end

  private

    def set_experiment
      @experiment = Experiment.friendly.find(params[:id])
    end
end
