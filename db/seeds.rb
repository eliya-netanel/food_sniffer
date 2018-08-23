User.destroy_all
FoodItem.destroy_all
Ingredient.destroy_all
Scan.destroy_all

#Users
user_1 = User.create!(user_name:"Pini", first_name:"pinchas", last_name:"hodadad", email:"pinchas.hodadad@gmail.com",password:1234567)
user_2 = User.create!(user_name:"A", first_name:"pinchas", last_name:"hodadad", email:"a@gmail.com",password:1234567)
user_3 = User.create!(user_name:"B", first_name:"B", last_name:"hodadad", email:"b@b.com",password:1234567)


#food_items
food_items_1 = FoodItem.create!(name:"nutella", type_of: "sweet")

# #ingredients_
ingredients_1 = Ingredient.create!(name:"sugar", type_of: "condiment")

# #scans
scan_1 = Scan.create!(date:Date.today, result: true, user_id: user_1.id, food_item_id: food_items_1.id)




