Diet.destroy_all
User.destroy_all
FoodItem.destroy_all
Ingredient.destroy_all
Scan.destroy_all
Ingredient.destroy_all

#Users
user_1 = User.create!(user_name:"Pini", first_name:"pinchas", last_name:"hodadad", email:"pinchas.hodadad@gmail.com",password:1234567)
user_2 = User.create!(user_name:"A", first_name:"pinchas", last_name:"hodadad", email:"a@gmail.com",password:1234567)
user_3 = User.create!(user_name:"B", first_name:"B", last_name:"hodadad", email:"b@b.com",password:1234567)


#food_items
food_items_1 = FoodItem.create!(name:"nutella", type_of: "sweet")

#ingredients

#Gluten-free
glutens = [
Ingredient.create!(name:"wheat"),
Ingredient.create!(name:"barley"),
Ingredient.create!(name:"oats"),
Ingredient.create!(name:"rye"),
Ingredient.create!(name:"wheat"),
Ingredient.create!(name:"spelt"),
Ingredient.create!(name:"triticale"),
Ingredient.create!(name:"kamut"),
Ingredient.create!(name:"wheatberries"),
Ingredient.create!(name:"durum"),
Ingredient.create!(name:"emmer"),
Ingredient.create!(name:"semolina"),
Ingredient.create!(name:"spelt"),
Ingredient.create!(name:"farina"),
Ingredient.create!(name:"farro"),
Ingredient.create!(name:"graham"),
Ingredient.create!(name:"einkorn wheat"),
Ingredient.create!(name:"malted barley flour"),
Ingredient.create!(name:"malt"),
Ingredient.create!(name:"malted milk"),
Ingredient.create!(name:"malt extract"),
Ingredient.create!(name:"malt flavoring"),
Ingredient.create!(name:"malt vinegar"),
Ingredient.create!(name:"brewes Yeast"),
Ingredient.create!(name:"Wheat starch"),
]
#Vegetarian
vegetarians = [
Ingredient.create!(name:"meat"),
Ingredient.create!(name:"beef"),
Ingredient.create!(name:"lamb"),
Ingredient.create!(name:"pork"),
Ingredient.create!(name:"veal"),
Ingredient.create!(name:"horse"),
Ingredient.create!(name:"organ meat"),
Ingredient.create!(name:"wild meat"),
Ingredient.create!(name:"poultry"),
Ingredient.create!(name:"chicken"),
Ingredient.create!(name:"turkey"),
Ingredient.create!(name:"goose"),
Ingredient.create!(name:"duck"),
Ingredient.create!(name:"quail"),
]

#Vegan
vegans = [
Ingredient.create!(name:"meat"),
Ingredient.create!(name:"beef"),
Ingredient.create!(name:"lamb"),
Ingredient.create!(name:"pork"),
Ingredient.create!(name:"veal"),
Ingredient.create!(name:"horse"),
Ingredient.create!(name:"organ meat"),
Ingredient.create!(name:"wild meat"),
Ingredient.create!(name:"poultry"),
Ingredient.create!(name:"chicken"),
Ingredient.create!(name:"turkey"),
Ingredient.create!(name:"goose"),
Ingredient.create!(name:"duck"),
Ingredient.create!(name:"quail"),
Ingredient.create!(name:"fish"),
Ingredient.create!(name:"anchovies"),
Ingredient.create!(name:"shrimp"),
Ingredient.create!(name:"seafood"),
Ingredient.create!(name:"squid"),
Ingredient.create!(name:"scallops"),
Ingredient.create!(name:"calamari"),
Ingredient.create!(name:"mussels"),
Ingredient.create!(name:"crab"),
Ingredient.create!(name:"lobster"),
Ingredient.create!(name:"fish sauce"),
Ingredient.create!(name:"dairy"),
Ingredient.create!(name:"milk"),
Ingredient.create!(name:"yogurt"),
Ingredient.create!(name:"cheese"),
Ingredient.create!(name:"butter"),
Ingredient.create!(name:"cream"),
Ingredient.create!(name:"ice cream"),
Ingredient.create!(name:"eggs"),
Ingredient.create!(name:"egg"),
Ingredient.create!(name:"cheese"),
Ingredient.create!(name:"butter"),
Ingredient.create!(name:"cream"),
Ingredient.create!(name:"ice cream"),
Ingredient.create!(name:"honey"),
Ingredient.create!(name:"bee pollen"),
Ingredient.create!(name:"royal jelly"),
Ingredient.create!(name:"E322"),
Ingredient.create!(name:"E422"),
Ingredient.create!(name:"E471"),
Ingredient.create!(name:"E542"),
Ingredient.create!(name:"E631"),
Ingredient.create!(name:"E901"),
Ingredient.create!(name:"E904"),
Ingredient.create!(name:"cochineal"),
Ingredient.create!(name:"carmine"),
Ingredient.create!(name:"gelatine"),
Ingredient.create!(name:"isinglass"),
Ingredient.create!(name:"castoreum"),
Ingredient.create!(name:"omega-3"),
Ingredient.create!(name:"isinglass"),
Ingredient.create!(name:"shellac"),
Ingredient.create!(name:"D3"),
Ingredient.create!(name:"whey"),
Ingredient.create!(name:"casein"),
Ingredient.create!(name:"lactose"),
]

#Scans

scan_1 = Scan.create!(date:Date.today, result: true, user_id: user_1.id, food_item_id: food_items_1.id)

#Diet

#User
# diet_1 = Diet.create!(name:"My diet", user_id: user_1.id)

#Gluten-free
diet_gluten = Diet.create!(name:"Gluten-Free")
glutens.each do |gluten|
  diet_gluten.ingredients << gluten
end
diet_gluten.save!

#Vegetarian

diet_vegetarian = Diet.create!(name:"Vegetarian")
vegetarians.each do |vegetarian|
  diet_vegetarian.ingredients << vegetarian
end
diet_vegetarian.save!

#Vegan
diet_vegan = Diet.create!(name:"Vegan")
vegans.each do |vegan|
  diet_vegan.ingredients << vegan
end
diet_vegan.save!
