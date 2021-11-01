class CreateSquare < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.references :minefield, foreign_key: true
      t.integer :x_position
      t.integer :y_position
      t.integer :visibility_status
      t.integer :asociated_item
      t.timestamps
    end
  end
end
