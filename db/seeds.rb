# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Painting.create(title: 'Paint1', description: 'first painting', image: '123.jpg', gallary_id: 1)
Gallery.create(title: 'gallery1', description: 'first gallery')
User.create(name: 'Evan', email: 'evan@co', password: '123')
