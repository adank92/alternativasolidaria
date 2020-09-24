class CreateAvailableDays < ActiveRecord::Migration[6.0]
  def change
    create_table :available_days do |t|
      t.date :date

      t.timestamps
    end
    add_index :available_days, :date, unique: true
  end
end
