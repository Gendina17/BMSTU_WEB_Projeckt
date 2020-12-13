# frozen_string_literal: true

# All logic
class MainController < ApplicationController
  before_action :set_user, only: %i[index my_profile edit create destroy love_users search likers profile]
  def index
    all_persons = User.all.order(:id).reverse_order
    if (@_current)
      @persons = []
      all_persons.find_each do |person|
        @persons << person unless UserCommunication.find_by_liker_and_like(@_current.id, person.id)
      end
      @persons = @persons.reverse
    else
      @persons = all_persons
    end
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

  def love_users
    all_id = []
    UserCommunication.where(liker: @_current.id).find_each do |communication|
      all_id << communication.like
    end
    @all_users = all_id.map { |current_id| User.find_by_id(current_id) }
  end

  def destroy
    @_current.destroy
    redirect_to root_url
  end

  def add
    @kogo = params[:kogo]
    kto = params[:kto]
    comm = UserCommunication.new
    comm.liker = kto
    comm.like = @kogo
    if comm.save
      respond_to do |format|
        format.js
      end
    end
  end

  def delete
    @kogo = params[:kogo]
    delete_communication(@kogo, params[:kto])
    respond_to do |format|
      format.js
    end
  end

  def delete_card
    @kogo = params[:kogo]
    delete_communication(@kogo, params[:kto])
    respond_to do |format|
      format.js
    end
  end

  def likers
    id = params[:id].to_i
    if id.to_s =~ /\A[0-9]+\Z/
      if (@user = User.find_by_id(id))
        all_id = []
        UserCommunication.where(like: id).find_each do |communication|
          all_id << communication.liker
        end
        @persons = all_id.map { |current_id| User.find_by_id(current_id) }
      else
        render :error
      end
    else
      render :error
    end
  end

  private

  def delete_communication(kogo, kto)
    communication_to_delete = UserCommunication.find_by_like_and_liker(kogo, kto)
    communication_to_delete.destroy
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :city, :town,
                                 :status, :info, :group, :born, :contact, :avatar, :love_status)
  end

  def set_user
    @_current = User.find_by_id(session[:current_user_id])
  end
end
