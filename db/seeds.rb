User.destroy_all

User.create!(api_token: SecureRandom.hex, name: 'Sergio Tapia', role: 'Admin')
