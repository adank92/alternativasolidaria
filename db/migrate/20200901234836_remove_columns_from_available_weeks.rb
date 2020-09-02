class RemoveColumnsFromAvailableWeeks < ActiveRecord::Migration[6.0]
  def change
    remove_column :available_weeks, :number, :integer
    remove_column :available_weeks, :year, :integer
    add_reference :available_weeks, :week, null: false, foreign_key: true
  end
end
