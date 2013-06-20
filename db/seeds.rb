# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create (username: "Sue", password: "Sue", mem_type: "Admin")
Member.create (username: "Jan", password: "Jan", mem_type: "User")

Ingredient.create (ing_name: "Pale Malt (2 Row)", ing_type: "Grain")
Ingredient.create (ing_name: "Amarillo", ing_type: "Hop")

Recipe.create (recipe_name: "Amarillo Blonde", recipe_type: "Ale")
Recipe.create (recipe_name: "Amarillo Blonde", recipe_type: "Ale")
