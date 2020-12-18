# frozen_string_literal: true

# Application
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  before_action :authenticate, except: %i[signup signin new create index]
  before_action :set_locale
  before_action :default_url_options

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by_id(session[:current_user_id])
  end

  private

  def authenticate
    redirect_to signin_path unless current_user
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
