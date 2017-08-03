# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

10.times do
  ingredient = Ingredient.create(name: Faker::Food.ingredient)
  cocktail = Cocktail.create(name: Faker::Beer.name)

  dose = Dose.new()
  dose.cocktail = cocktail
  dose.ingredient = ingredient
  dose.description = "#{rand(250)+20}ml"
  dose.save!
end
