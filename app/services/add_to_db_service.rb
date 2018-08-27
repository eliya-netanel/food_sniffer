require 'uri'
require 'rest-client'

# URI.encode("Hello there world")
class AddToDbService
  def initialize(code, ingredients, product_name)
    password = ENV['FOOD_DB_PASSWORD']
    product_name = URI.encode(product_name)
    ingredients_string = URI.encode(ingredients)
    @url = "https://world.openfoodfacts.org/cgi/product_jqm2.pl?code=#{code
      }&user_id=eliya3&password=#{password
      }&product_name=#{product_name
      }&ingredients_text_en=#{ingredients_string}" #salt%2csuger%2cwater"
  end

  def call
    result = RestClient.get(@url)#, {}, {})
    # raise
  end
end

# code=072417136160
# product_name=Maryland%20Choc%20Chip
# labels=Vegan%2C%20Fat%20free
# ingredients_text=Fortified%20wheat%20flour%2C%20Chocolate%20chips%20%2825%25%29%2C%20Sugar%2C%20Palm%20oil%2C%20Golden%20syrup%2C%20Whey%20and%20whey%20derivatives%20%28Milk%29%2C%20Raising%20agents%2C%20Salt%2C%20Flavouring
