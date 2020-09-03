# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

buenos_aires = Province.create(name: "GBA")
caba = Province.create(name: "CABA")

comuna = Department.create(name: "Zona norte 1", province: buenos_aires)
Locality.create(name: 'Boulogne', department: comuna)

comuna = Department.create(name: "Comuna 1", province: caba)
['Retiro', 'San Nicolás', 'Puerto Madero', 'San Telmo', 'Monserrat', 'Constitución'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 2", province: caba)
Locality.create(name: 'Recoleta', department: comuna)

comuna = Department.create(name: "Comuna 3", province: caba)
['San Cristóbal', 'Balvanera'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 4", province: caba)
['Boca', 'Barracas', 'Parque Patricios', 'Nueva Pompeya'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 5", province: caba)
['Almagro', 'Boedo'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 6", province: caba)
Locality.create(name: 'Caballito', department: comuna)

comuna = Department.create(name: "Comuna 7", province: caba)
['Flores', 'Parque Chacabuco'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 8", province: caba)
['Villa Soldati', 'Villa Riachuelo', 'Villa Lugano'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 9", province: caba)
['Parque Avellaneda', 'Liniers', 'Mataderos'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 10", province: caba)
['Villa Real', 'Monte Castro', 'Versalles', 'Floresta', 'Vélez Sársfield', 'Villa Luro'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 11", province: caba)
['Villa Gral. Mitre', 'Villa Devoto', 'Villa del Parque', 'Villa Santa Rita'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 12", province: caba)
['Coghlan', 'Saavedra', 'Villa Urquiza', 'Villa Pueyrredón'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 13", province: caba)
['Belgrano', 'Núñez', 'Colegiales'].each do |name|
  Locality.create(name: name, department: comuna)
end

comuna = Department.create(name: "Comuna 14", province: caba)
Locality.create(name: 'Palermo', department: comuna)

comuna = Department.create(name: "Comuna 15", province: caba)
['Chacarita', 'Villa Crespo', 'Paternal', 'Villa Ortúzar', 'Agronomía', 'Parque Chas'].each do |name|
  Locality.create(name: name, department: comuna)
end
