class AddAvailableDaysToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :available_days, :integer, null: false, default: 0, limit: 8
  end
end
