# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'open-uri'
require 'json'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
read_url = open(url).read
content = JSON.parse(read_url)
content2 = content['drinks']

newarray = []

content2.each do |drink|
  drink_ingredient = drink['strIngredient1']
  newarray << drink_ingredient

 # Ingredient.create(name: drink_ingredient)
end
newarray.sort!

newarray.each do |ingredient|
  Ingredient.create(name: ingredient)
end

p "finished uploading"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
