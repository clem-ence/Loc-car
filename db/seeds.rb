# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Car.destroy_all
User.destroy_all
puts "Seeds destroyed"

User.create(email: "toto@gmail.com", password: "123456", password_confirmation: "123456")
User.create(email: "pat@gmail.com", password: "1234567", password_confirmation: "1234567")
User.create(email: "iceman@gmail.com", password: "1234567", password_confirmation: "1234567")

puts "Users created..."

Car.create(name: "Juva4", price_per_day: 300, description: "Vieille voiture")
Car.create(name: "Ford Mustang", price_per_day: 700, description: "Année 1984")
Car.create(name: "Renault 25", price_per_day: 300, description: "Modèle Courchevel")


puts "cars created..."
