class AddAuthorToWalls < ActiveRecord::Migration[6.0]
  def change
    add_column :walls, :author, :integer
  end
end
