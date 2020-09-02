class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.integer :number
      t.integer :year

      t.index [:number, :year], unique: true
      t.timestamps
    end
  end
end
