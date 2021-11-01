class AddGameCountParamsToMinefield < ActiveRecord::Migration[5.2]
  def change
    add_column :minefields, :mines_number, :integer
    add_column :minefields, :found_spaces, :integer
  end
end
