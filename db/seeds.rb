# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fast_food = Category.where(name: "Fast Food").first_or_create(name: "Fast Food")
seafood = Category.where(name: "Seafood").first_or_create(name: "Seafood")
steak = Category.where(name: "Steak House").first_or_create(name: "Steak House")
chinese = Category.where(name: "Chinese").first_or_create(name: "Chinese")
family = Category.where(name: "Family").first_or_create(name: "Family")
coffee = Category.where(name: "Coffee").first_or_create(name: "Coffee")
