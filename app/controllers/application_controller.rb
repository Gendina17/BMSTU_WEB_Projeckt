class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  before_action :authenticate, except: %i[signup signin new create index]

  def current_user
    @_current_user ||= session[:current_user_id] &&
        User.find_by_id(session[:current_user_id])
  end

  private

  def authenticate
    redirect_to signin_path unless current_user
  end
end
