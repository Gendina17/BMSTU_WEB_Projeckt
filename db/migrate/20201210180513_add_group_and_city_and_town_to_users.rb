# frozen_string_literal: true

class AddGroupAndCityAndTownToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :group, :string
    add_column :users, :city, :string
    add_column :users, :town, :string
    add_column :users, :status, :string
    add_column :users, :info, :text
    add_column :users, :contact, :string
    add_column :users, :born, :date
  end
end
