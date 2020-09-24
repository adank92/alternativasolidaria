class CreateJoinTableZoneLocality < ActiveRecord::Migration[6.0]
  def change
    create_join_table :zones, :localities do |t|
      # t.index [:zone_id, :locality_id]
      # t.index [:locality_id, :zone_id]
    end
  end
end
