class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :reference_name
      t.integer :meal_quantity
      t.references :locality, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.timestamps
    end
  end
end
