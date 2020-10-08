require 'csv'

namespace :localities do
  task migrate: :environment do
    Province.transaction do
      Province.find_by(name: 'GBA')&.update(name: 'BUENOS AIRES')
      Locality.find_each { |l| l.update!(name: I18n.transliterate(l.name.upcase))}
      Province.find_each { |province| province.localities = province.departments.flat_map(&:localities) }
      Locality.find_by(name: 'VILLA GRAL. MITRE')&.update!(name: 'VILLA GENERAL MITRE')
      Locality.find_by(name: 'NUNEZ')&.update!(name: 'NUÑEZ')
    end
  end

  task create: :environment do
    Province.transaction do
      buenos_aires = Province.find_or_create_by!(name: 'BUENOS AIRES')
      find_localities('Buenos Aires').each { |l| buenos_aires.localities.find_or_create_by!(name: l) }

      caba = Province.find_or_create_by!(name: 'CABA')
      find_localities('Ciudad Autónoma de Buenos Aires').each { |l| caba.localities.find_or_create_by!(name: l) }

      Locality.find_by(name: 'CIUDAD DE BUENOS AIRES').destroy!
      Locality.find_by(name: 'BOCA').update!(name: 'LA BOCA')
    end
  end

  def find_localities(province_name)
    localities = CSV.read('lib/tasks/localities.csv')
    localities.select { |r| r[-1] == province_name }.map { |r| r[11] }.uniq
  end
end
