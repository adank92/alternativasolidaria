class RenameWeekFromAvailableWeeks < ActiveRecord::Migration[6.0]
  def change
    rename_column :available_weeks, :week, :number
  end
end
