class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def query_params
    params[:q]
  end

  def locale_param 
    %w[es en].include?(params[:locale]) ? params[:locale] : 'es'
  end
end
