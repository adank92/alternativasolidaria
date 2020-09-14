require 'csv'

namespace :users do
  task :import => :environment do
    User.transaction do
      CSV.read('voluntarios1.csv').each_with_index do |row, i|
        roles = (row[0].strip.downcase == 'cocinero') ? [:chef] : [:distributor]
        status = case row[1].strip.downcase
                 when 'activo'
                   'active'
                 when 'inactivo'
                   'inactive'
                 else
                   'fresh'
                 end

        name = [row[2], row[3]].compact.map(&:strip).join(' ')
        locality = Locality.where("lower(name) = ?", row[6].strip.downcase).first
        address = row[7] || 'Sin direccion'
        phone = row[8]&.gsub("-", "")&.gsub(" ", "") || "99999"
        email = row[9]&.downcase || "no_existe@#{i}.com"
        weeks = []
        weeks << Week.find_by(number: 36) if row[10].present? || row[11].present?
        weeks << Week.find_by(number: 37) if row[12].present? || row[13].present?
        weeks << Week.find_by(number: 38) if row[14].present? || row[15].present?
        weeks << Week.find_by(number: 39) if row[16].present? || row[17].present?

        attrs = { status: status, name: name, locality: locality, address: address, phone: phone, email: email,
                  weeks: weeks, password: SecureRandom.alphanumeric(12), roles: roles }
        puts "Creating: #{attrs}"
        User.create!(attrs)
      end
    end
  end
end
