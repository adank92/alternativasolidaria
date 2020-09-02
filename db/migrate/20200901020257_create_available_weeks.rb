class CreateAvailableWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :available_weeks do |t|
      t.integer :week
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
