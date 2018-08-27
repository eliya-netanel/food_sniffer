require 'open-uri'
require 'json'
# require-relative ''


# item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/#{code}.json").read)
item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/5449000000996.json").read)
puts "1"
puts item_info["code"]
puts "name:", item_info["product"]["product_name"]
puts "image:", item_info["product"]["image_front_url"]
puts "ingredients:", item_info["product"]["ingredients_text_en"]
puts "labels:", item_info["product"]["labels"]

item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/737628064502.json").read)
# puts item_info["code"]
puts "2"
puts item_info["code"]
puts "name:", item_info["product"]["product_name"]
puts "image:", item_info["product"]["image_front_url"]
puts "ingredients:", item_info["product"]["ingredients_text_en"]
puts "labels:", item_info["product"]["labels"]

item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/8032817240319.json").read)
# puts item_info["code"]
puts "3"
puts item_info["code"]
puts "name:", item_info["product"]["product_name"]
puts "image:", item_info["product"]["image_front_url"]
puts "ingredients:", item_info["product"]["ingredients_text_en"]
puts "labels:", item_info["product"]["labels"]

item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/7290000174099.json").read)
# puts item_info["code"]
puts "3"
puts item_info["code"]
puts "name:", item_info["product"]["product_name"]
puts "image:", item_info["product"]["image_front_url"]
puts "ingredients:", item_info["product"]["ingredients_text_en"]
puts "labels:", item_info["product"]["labels"]

# item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/0038000138607.json").read)
# # puts item_info["code"]
# puts "3"
# puts item_info["code"]
# puts "name:", item_info["product"]["product_name"]
# puts "image:", item_info["product"]["image_front_url"]
# puts "ingredients:", item_info["product"]["ingredients_text_en"]
# puts "labels:", item_info["product"]["labels"]
