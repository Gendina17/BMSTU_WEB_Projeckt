class CreateWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :walls do |t|
      t.text :body
      t.text :status
      t.string :title

      t.timestamps
    end
  end
end
