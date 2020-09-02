class RemoveAvailableDaysFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :available_days, :integer
  end
end
