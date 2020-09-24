class DropWeeks < ActiveRecord::Migration[6.0]
  def up
    drop_table :available_weeks
    drop_table :weeks
  end
end
