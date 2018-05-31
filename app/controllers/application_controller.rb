class ApplicationController < ActionController::Base
  def query_params
    params[:q]
  end
end
