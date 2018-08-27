# @simple_form_for
# f.input = product_name
# f.input = ingredients
# f.input = label??
# f.submit


# ingredients = params[:ingredients].split(',')
# "https://world.openfoodfacts.org/cgi/product_jqm2.pl?code=#{product_code}&user_id=eliya3&password=111111&product_name=#{params[:product_name]}&ingredients_text_en=#{ingredients.each { |i| i + "%2c" }}" #salt%2csuger%2cwater"

# code=072417136160
# product_name=Maryland%20Choc%20Chip
# labels=Vegan%2C%20Fat%20free
# ingredients_text=Fortified%20wheat%20flour%2C%20Chocolate%20chips%20%2825%25%29%2C%20Sugar%2C%20Palm%20oil%2C%20Golden%20syrup%2C%20Whey%20and%20whey%20derivatives%20%28Milk%29%2C%20Raising%20agents%2C%20Salt%2C%20Flavouring
