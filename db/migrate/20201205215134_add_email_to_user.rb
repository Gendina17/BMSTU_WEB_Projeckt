# frozen_string_literal: true

class AddEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
