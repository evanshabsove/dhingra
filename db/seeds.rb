# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Painting.create(title: 'Paint1', description: 'first painting', image: '123.jpg', gallery_id: 1)
Gallery.create(title: 'gallary1', description: 'first gallary')
User.create(name: 'Evan', email: 'evan@co', password: '123', :admin => true)


Product.delete_all
Product.create! id: 1, name: "Banana", active: true
Product.create! id: 2, name: "Apple", active: true
Product.create! id: 3, name: "Carton of Strawberries", active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
