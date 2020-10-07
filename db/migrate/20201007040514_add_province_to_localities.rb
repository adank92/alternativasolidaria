class AddProvinceToLocalities < ActiveRecord::Migration[6.0]
  def change
    add_reference :localities, :province, null: true, foreign_key: true
    change_column_null :localities, :department_id, true
    remove_foreign_key :localities, :departments
  end
end
