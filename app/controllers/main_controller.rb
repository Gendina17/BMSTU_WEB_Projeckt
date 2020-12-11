# frozen_string_literal: true

# All logic
class MainController < ApplicationController
  before_action :set_user, only: %i[index my_profile edit create destroy]
  def index
    @persons = User.all.order(:id).reverse_order
  end

  def my_profile; end

  def profile
    id = params[:id].to_i
    if id.to_s =~ /\A[0-9]+\Z/
      if (@man = User.find_by_id(id))
      else
        render :error
      end
    else
      render :error
    end
  end

  def set_user
    @_current = User.find_by_id(session[:current_user_id])
  end

  def edit; end

  def create
    if !request.get?
      current_user
      if @_current.update(user_params)
        redirect_to main_my_profile_path
      else
        render :edit
      end
    else redirect_to main_edit_path
    end
  end

  def love_users; end

  def destroy
    @_current.destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :city, :town,
                                 :status, :info, :group, :born, :contact, :avatar, :love_status)
  end
end
