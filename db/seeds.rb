User.destroy_all
Location.destroy_all

User.create!(api_token: SecureRandom.hex, name: 'Sergio Tapia', role: 'Admin')

Location.create!(name: 'Santa Cruz')
Location.create!(name: 'Cochabamba')
Location.create!(name: 'La Paz')
Location.create!(name: 'Tarija')
Location.create!(name: 'Beni')
Location.create!(name: 'Pando')
Location.create!(name: 'Oruro')
Location.create!(name: 'Chuquisaca')
Location.create!(name: 'Potosi')
