class CreateBoulogneLocality < ActiveRecord::Migration[6.0]
  def up
    ba = Province.find_by(name: "Buenos Aires")
    if ba.present?
      ba.update(name: 'GBA')
      department = ba.departments.create!(name: "Zona norte 1")
      department.localities.create(name: 'Boulogne')
    end
  end
end
