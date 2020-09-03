class CreateBoulogneLocality < ActiveRecord::Migration[6.0]
  def change
    Province.where(name: "Buenos Aires").update_all(name: 'GBA')
    department = Province.find_by(name: 'GBA').departments.create!(name: "Zona norte 1")
    department.localities.create(name: 'Boulogne')
  end
end
