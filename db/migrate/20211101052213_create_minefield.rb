class CreateMinefield < ActiveRecord::Migration[5.2]
  def change
    create_table :minefields do |t|
      t.string :uuid
      t.integer :x_size
      t.integer :y_size
      t.integer :status
      t.timestamps
    end
  end
end
