class RemoveDropOffsFromTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :drop_off_date, :date
    remove_column :teams, :drop_off_time_range, :string
  end
end
