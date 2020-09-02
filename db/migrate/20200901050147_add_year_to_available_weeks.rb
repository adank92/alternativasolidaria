class AddYearToAvailableWeeks < ActiveRecord::Migration[6.0]
  def change
    add_column :available_weeks, :year, :integer
  end
end
