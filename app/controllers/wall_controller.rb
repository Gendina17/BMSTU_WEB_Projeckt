# frozen_string_literal: true

# Model wall
class WallController < ApplicationController
  before_action :set_user, only: %i[records add_record create_record update edit_record]
  def records
    @id = params[:id].to_i
    if @id.to_s =~ /\A[0-9]+\Z/
      @records = Wall.where(author: @id).order(:id).reverse_order
      @author = User.find_by_id(@id)
    else
      render :error
    end

  end

  def add_record
    @record = Wall.new
  end

  def create_record
    current_user
    @new_record = Wall.new(record_params)
    @new_record.author = @_current.id
    if @new_record.save
      redirect_to "/records/#{@_current.id}"
    else
      render :add_record

    end
  end

  def delete_record
    @id = params[:id]
    record_to_delete = Wall.find_by_id(@id)
    record_to_delete.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit_record
    @id = params[:id]
    @edit_record = Wall.find_by_id(@id)
  end

  def update
    if !request.get?
      if Wall.find(params[:id]).update(record_params)
        redirect_to "/records/#{@_current.id}"
      else
        render :edit_record
      end
    else redirect_to edit_record_path
    end
  end

  private

  def set_user
    @_current = User.find_by_id(session[:current_user_id])
  end

  def record_params
    params.require(:wall).permit(:title, :body, :status)
  end
end
