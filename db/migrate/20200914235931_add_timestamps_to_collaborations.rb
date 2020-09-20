class AddTimestampsToCollaborations < ActiveRecord::Migration[6.0]
  def change
    # add new column but allow null values
    add_timestamps :collaborations, null: true

    # backfill existing records with created_at and updated_at
    today = Date.today
    Collaboration.update_all(created_at: today, updated_at: today)

    # change to not null constraints
    change_column_null :collaborations, :created_at, false
    change_column_null :collaborations, :updated_at, false
  end
end
