User.destroy_all
Location.destroy_all
Subcategory.destroy_all
Category.destroy_all

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

clases = Category.create!(name: 'Clases')
comunidad = Category.create!(name: 'Comunidad')
viviendas = Category.create!(name: 'Viviendas - Locales')
compra = Category.create!(name: 'Compra - Venta')
trabajo = Category.create!(name: 'Trabajo')
servicios = Category.create!(name: 'Servicios')
motor = Category.create!(name: 'Motor')

clases.subcategories.create!(name: 'Tutores - Clases Particulares')
clases.subcategories.create!(name: 'Otros Cursos')
clases.subcategories.create!(name: 'Musica - Teatro - Danza')
clases.subcategories.create!(name: 'Cursos de Idiomas')
clases.subcategories.create!(name: 'Diseño Web - Multimedia')

comunidad.subcategories.create!(name: 'Musicos - Artistas')
comunidad.subcategories.create!(name: 'Eventos')
comunidad.subcategories.create!(name: 'Comunidad varios')
comunidad.subcategories.create!(name: 'Voluntarios')
comunidad.subcategories.create!(name: 'Perdido y Encontrado')
comunidad.subcategories.create!(name: 'Compartir coche')

viviendas.subcategories.create!(name: 'Piso - Casa en venta')
viviendas.subcategories.create!(name: 'Terrenos')
viviendas.subcategories.create!(name: 'Piso - Casa en alquiler')
viviendas.subcategories.create!(name: 'Alquiler Temporal')
viviendas.subcategories.create!(name: 'Oficinas - Locales')
viviendas.subcategories.create!(name: 'Locales en alquiler - en venta')
viviendas.subcategories.create!(name: 'Compartir piso')
viviendas.subcategories.create!(name: 'Intercambio de Casa')
viviendas.subcategories.create!(name: 'Parking')
