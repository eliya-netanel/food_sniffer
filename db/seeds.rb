User.destroy_all
FoodItem.destroy_all
Ingredient.destroy_all
Scan.destroy_all
date = DateTime.now.to_date.to_s
#Users
user_1 = User.create!(user_name:"Pini", first_name:"pinchas", last_name:"hodadad", email:"pinchas.hodadad@gmail.com",password:1234567)

#food_items
food_items_1 = FoodItem.create!(name:"nutella")

# #ingredients_
ingredients_1 = Ingredient.create!(name:"sugar")

# #scans
scan_1 = Scan.create!(date:date, result: true, user_id: user_1.id, food_item_id: food_items_1.id)




