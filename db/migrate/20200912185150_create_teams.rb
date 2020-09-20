class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.date :drop_off_date
      t.date :pick_up_date
      t.text :notes
      t.boolean :final, default: false, allow_nil: false

      t.timestamps
    end
  end
end
