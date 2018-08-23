require 'open-uri'
require 'json'

class GetProductService
  def initialize(upc)
    @upc = upc
  end

  def call
    item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/#{@upc}.json").read)
    # item_info = JSON.parse(open("https://world.openfoodfacts.org/api/v0/product/5449000000996.json").read)
    # puts "1"
    result = {}
    result[:code] = item_info["code"]
    result[:name] = item_info["product"]["product_name"]
    result[:image] = item_info["product"]["image_front_url"]
    result[:ingredients] = item_info["product"]["ingredients_text_en"]
    result[:labels] = item_info["product"]["labels"]
    result
    # result = {}
    # result << item_info["code"]
    # result << item_info["product"]["product_name"]
    # result[:image] = item_info["product"]["image_front_url"]
    # result[:ingredients] = item_info["product"]["ingredients_text_en"]
    # result[:labels] = item_info["product"]["labels"]
    # result
  end
end
