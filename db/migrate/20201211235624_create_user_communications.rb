class CreateUserCommunications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_communications do |t|
      t.integer :liker
      t.integer :like

      t.timestamps
    end
  end
end
