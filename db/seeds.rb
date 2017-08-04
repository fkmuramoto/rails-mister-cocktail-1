# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Get list of ingredients with html parsing

data = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients_hash = JSON.parse(data)

# Destroy all previous seeds at start
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients_hash["drinks"].first(100).each do |ingredient_hash|
  Ingredient.create!(name: ingredient_hash["strIngredient1"])
end
ingredients = Ingredient.all

10.times do |i|
  cocktail = Cocktail.create(name: Faker::Beer.name)

  10.times do |j|
    dose = Dose.new()
    dose.cocktail = cocktail
    dose.ingredient = ingredients[(10*i) + j]
    dose.description = "#{rand(250)+20}ml"
    dose.save!
  end
end
