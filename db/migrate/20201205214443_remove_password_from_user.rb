class RemovePasswordFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :text
    remove_column :users, :email, :text
    remove_column :users, :first_name, :test
    remove_column :users, :last_name, :text
  end
end
