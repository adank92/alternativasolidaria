class CreateJoinTableUserAvailableDay < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :available_days do |t|
      # t.index [:user_id, :available_day_id]
      # t.index [:available_day_id, :user_id]
    end
  end
end
