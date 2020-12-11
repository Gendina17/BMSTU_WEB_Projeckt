# frozen_string_literal: true

# Controller for session
class SessionController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]

  def new
    @_current = User.find_by_id(session[:current_user_id])
    redirect_to main_index_path if @_current
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?

      redirect_to signin_url, alert: 'Invalid email/password combination.'

    else
      sign_in user
      redirect_to main_index_path
    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end
