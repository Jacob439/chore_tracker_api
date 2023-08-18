class CreateDishwasherTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :dishwasher_turns do |t|
      t.string :name
      t.boolean :inorder

      t.timestamps
    end
  end
end
