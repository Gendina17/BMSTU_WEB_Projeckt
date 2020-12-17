# frozen_string_literal: true

# Controller for signup
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    redirect_to signup_path
  end

  def new
    @_current = User.find_by_id(session[:current_user_id])
    redirect_to main_index_path if @_current
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to session_new_path
    else
      render :new

    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :password_confirmation)
  end
end
