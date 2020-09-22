class CreateTeamDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :team_destinations do |t|
      t.references :team, polymorphic: true
      t.references :destination, null: false, foreign_key: true
      t.integer :meal_quantity

      t.timestamps
    end
  end
end
