class ScansController < ApplicationController
   # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!#, only: [:home]
  def index
    @scans = current_user.scans.order(created_at: :desc)#.where(:product_name.distinct)
  end

  def new
    @scan = Scan.new
  end

  def get_product
    #gets code from js
    product_code = params[:upc]
    #sends to service the code to get info(the service is a parser)
    product_info = GetProductService.new(product_code).call
    diet   = Diet.new
    # result = check_product(product_info[:ingredients])
      #to check if the info gets to the page(in network):
        # render :json => {product: product_info}
    scan        = Scan.new()
    scan.user   = current_user
    #if the product exists in DB:
    if product_info
      scan.product_name = product_info[:name]
      scan.ingredients = product_info[:ingredients]#.lowercase #make sure if ok
      result = check_product(product_info[:ingredients])
      scan.result = result
    #if doesnt exist in DB:
    else
      scan.result = nil
    end
      scan.save
      redirect_to scan_path(scan)
  end

  # def create
  #   raise
  #   redirect_to root_path
  #   @scan = Scan.new
  #   @scan.user = current_user
  #   @scan.result = call_to_api
  #   @scan.save
  # end

  def show
    @scan = Scan.find(params[:id])
  end

  def edit
    # form for
    @scan = Scan.find(params[:id])
  end

  def update

  end
private

def check_product(ingredients) #if is vegetarian
    product_ingredients = ingredients.split(",")
    product_ingredients.map! { |ingredient| ingredient.strip! }
    # raise
    # result = @ingredients & product_ingredients
    # binding.pry
    # map/each! the array so its lowercase
# diet.where(:user = current_user)
    result_array = ["milk"] & product_ingredients
    # compere both arrays, returns, result
    # raise
    result_array.empty?
  end

end
