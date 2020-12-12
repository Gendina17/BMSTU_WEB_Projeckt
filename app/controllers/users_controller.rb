# frozen_string_literal: true

# Controller for signup
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    # redirect_to signup_path
    @users = User.all
    data = @users.map do |inst|
      { first_name: inst.first_name, email: inst.email, password: inst.password_digest, last_name: inst.last_name }
    end
    respond_to do |format|
      format.html
      format.xml { render xml: data.to_xml }
    end
  end

  def in
    # redirect_to signup_path
    @users = UserCommunication.all
    data = @users.map do |inst|
      { liker: inst.liker, like: inst.like}
    end
    respond_to do |format|
      format.html
      format.xml { render xml: data.to_xml }
    end
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

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :password_confirmation)
  end
end
