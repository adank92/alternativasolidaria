class AddTimesToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :drop_off_time_range, :string
    add_column :teams, :pick_up_time_range, :string
  end
end
