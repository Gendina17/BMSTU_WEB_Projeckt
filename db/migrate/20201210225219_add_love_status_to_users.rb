# frozen_string_literal: true

class AddLoveStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :love_status, :string
  end
end
