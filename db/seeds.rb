Diet.destroy_all
User.destroy_all
FoodItem.destroy_all
Ingredient.destroy_all
Scan.destroy_all
Ingredient.destroy_all

#---Users--
user_1 = User.create!(user_name:"Pini", first_name:"pinchas", last_name:"hodadad", email:"pinchas.hodadad@gmail.com",password:1234567)
user_2 = User.create!(user_name:"A", first_name:"pinchas", last_name:"hodadad", email:"a@gmail.com",password:1234567)
user_3 = User.create!(user_name:"B", first_name:"B", last_name:"hodadad", email:"b@b.com",password:1234567)


#---food_items--
food_items_1 = FoodItem.create!(name:"nutella", type_of: "sweet")

#---ingredients--

#---Gluten-free---
gluten = [

Ingredient.create!(name:"wheat", type_of:"gluten"),
Ingredient.create!(name:"barley", type_of:"gluten"),
Ingredient.create!(name:"oats", type_of:"gluten"),
Ingredient.create!(name:"rye", type_of:"gluten"),
Ingredient.create!(name:"wheat", type_of:"gluten"),
Ingredient.create!(name:"spelt", type_of:"gluten"),
Ingredient.create!(name:"triticale", type_of:"gluten"),
Ingredient.create!(name:"kamut", type_of:"gluten"),
Ingredient.create!(name:"wheatberries", type_of:"gluten"),
Ingredient.create!(name:"durum", type_of:"gluten"),
Ingredient.create!(name:"emmer", type_of:"gluten"),
Ingredient.create!(name:"semolina", type_of:"gluten"),
Ingredient.create!(name:"spelt", type_of:"gluten"),
Ingredient.create!(name:"farina", type_of:"gluten"),
Ingredient.create!(name:"farro", type_of:"gluten"),
Ingredient.create!(name:"graham", type_of:"gluten"),
Ingredient.create!(name:"einkorn wheat", type_of:"gluten"),
Ingredient.create!(name:"malted barley flour", type_of:"gluten"),
Ingredient.create!(name:"malt", type_of:"gluten"),
Ingredient.create!(name:"malted milk", type_of:"gluten"),
Ingredient.create!(name:"malt extract", type_of:"gluten"),
Ingredient.create!(name:"malt flavoring", type_of:"gluten"),
Ingredient.create!(name:"malt vinegar", type_of:"gluten"),
Ingredient.create!(name:"brewes Yeast",  type_of:"gluten"),
Ingredient.create!(name:"Wheat starch", type_of:"gluten"),

]
#---Vegetarian---

meat = [

Ingredient.create!(name:"meat", type_of:"meat"),
Ingredient.create!(name:"beef", type_of:"meat"),
Ingredient.create!(name:"lamb", type_of:"meat"),
Ingredient.create!(name:"pork", type_of:"meat"),
Ingredient.create!(name:"veal", type_of:"meat"),
Ingredient.create!(name:"horse", type_of:"meat"),
Ingredient.create!(name:"organ meat", type_of:"meat"),
Ingredient.create!(name:"wild meat", type_of:"meat"),
Ingredient.create!(name:"poultry", type_of:"meat"),
Ingredient.create!(name:"chicken", type_of:"meat"),
Ingredient.create!(name:"turkey", type_of:"meat"),
Ingredient.create!(name:"goose", type_of:"meat"),
Ingredient.create!(name:"duck", type_of:"meat"),
Ingredient.create!(name:"quail", type_of:"meat"),


]

#---Vegan---

seafood = [

Ingredient.create!(name:"fish", type_of:"seafood"),
Ingredient.create!(name:"anchovies", type_of:"seafood"),
Ingredient.create!(name:"shrimp", type_of:"seafood"),
Ingredient.create!(name:"seafood", type_of:"seafood"),
Ingredient.create!(name:"squid", type_of:"seafood"),
Ingredient.create!(name:"scallops", type_of:"seafood"),
Ingredient.create!(name:"calamari", type_of:"seafood"),
Ingredient.create!(name:"mussels", type_of:"seafood"),
Ingredient.create!(name:"crab", type_of:"seafood"),
Ingredient.create!(name:"lobster", type_of:"seafood"),
Ingredient.create!(name:"fish sauce", type_of:"seafood"),

]

dairy = [

Ingredient.create!(name:"dairy", type_of:"dairy"),
Ingredient.create!(name:"milk", type_of:"dairy"),
Ingredient.create!(name:"yogurt", type_of:"dairy"),
Ingredient.create!(name:"cheese", type_of:"dairy"),
Ingredient.create!(name:"butter", type_of:"dairy"),
Ingredient.create!(name:"cream", type_of:"dairy"),
Ingredient.create!(name:"ice cream", type_of:"dairy"),
Ingredient.create!(name:"cheese", type_of:"dairy"),
Ingredient.create!(name:"butter", type_of:"dairy"),
Ingredient.create!(name:"cream", type_of:"dairy"),
Ingredient.create!(name:"ice cream", type_of:"dairy"),
Ingredient.create!(name:"whey", type_of:"dairy"),
Ingredient.create!(name:"casein", type_of:"dairy"),
Ingredient.create!(name:"lactose", type_of:"dairy"),
Ingredient.create!(name:"milk powder", type_of:"dairy"),

]

artificial_coloring = [

Ingredient.create!(name:"E322", type_of:"artifical coloring"),
Ingredient.create!(name:"E422", type_of:"artifical coloring"),
Ingredient.create!(name:"E471", type_of:"artifical coloring"),
Ingredient.create!(name:"E542", type_of:"artifical coloring"),
Ingredient.create!(name:"E631", type_of:"artifical coloring"),
Ingredient.create!(name:"E901", type_of:"artifical coloring"),
Ingredient.create!(name:"E904", type_of:"artifical coloring"),

]

other_vegan_ingredients = [

Ingredient.create!(name:"eggs", type_of:"other vegan ingredients"),
Ingredient.create!(name:"egg", type_of:"other vegan ingredients"),
Ingredient.create!(name:"honey", type_of:"other vegan ingredients"),
Ingredient.create!(name:"bee pollen", type_of:"other vegan ingredients"),
Ingredient.create!(name:"royal jelly", type_of:"other vegan ingredients"),
Ingredient.create!(name:"cochineal", type_of:"other vegan ingredients"),
Ingredient.create!(name:"carmine", type_of:"other vegan ingredients"),
Ingredient.create!(name:"gelatine", type_of:"other vegan ingredients"),
Ingredient.create!(name:"isinglass", type_of:"other vegan ingredients"),
Ingredient.create!(name:"castoreum", type_of:"other vegan ingredients"),
Ingredient.create!(name:"omega-3", type_of:"other vegan ingredients"),
Ingredient.create!(name:"isinglass", type_of:"other vegan ingredients"),
Ingredient.create!(name:"shellac", type_of:"other vegan ingredients"),
Ingredient.create!(name:"D3", type_of:"other vegan ingredients"),

]

#Other
# other = [
# Ingredient.create!(name:"sugar"),
# Ingredient.create!(name:"salt"),
# Ingredient.create!(name:"cinnammon"),
# Ingredient.create!(name:"peanut"),
# ]

#----Scans---

scan_1 = Scan.create!(date:Date.today, result: true, user_id: user_1.id, food_item_id: food_items_1.id)

#----Diet----

#Gluten-free

diet_gluten_new = Diet.create!(name:"Gluten-Free")
gluten.each do |gluten|
  diet_gluten_new.ingredients << gluten
end
diet_gluten_new.save!

#Vegetarian
diet_vegetarian_new = Diet.create!(name:"Vegetarian")
meat.each do |meat|
  diet_vegetarian_new.ingredients << meat
end
diet_vegetarian_new.save!

#Vegan

diet_vegans = meat + seafood + dairy + artificial_coloring + other_vegan_ingredients
diet_vegan_new = Diet.create!(name:"Vegan")
diet_vegans.each do |vegan|
  diet_vegan_new.ingredients << vegan
end
diet_vegan_new.save!

#Lactose-Intolerant
diet_lactose_new = Diet.create!(name:"Dairy")
dairy.each do |dariy|
  diet_lactose_new.ingredients << dairy
end
diet_lactose_new.save!
# all_diets = glutens + vegetarians + vegans + customize
# diet_customize = Diet.create!(name:"My Diet")
#we only created a new diet because all of the ingredients arent black listed. So you can see all of it.
# all_diets.each do |ingredient|
#   diet_customize.ingredients << ingredient
# end
# diet_customize.save!

