class ApplicationController < ActionController::Base
  before_action :set_locale
  BRAND_NAME = 'Enmanuel Medina'.freeze

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

  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end

  def set_dark_mode
    mode = params[:mode] || 'dark'
    cookies[:mode] = { value: mode }
    redirect_back(fallback_location: root_path)
  end
end
