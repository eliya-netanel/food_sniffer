class ScansController < ApplicationController
   # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!#, only: [:home]
  def index

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
      #to check if the info gets to the page(in network):
        # render :json => {product: product_info}
    scan        = Scan.new()
    scan.user   = current_user
    #if the product exists in DB:
    if product_info
      scan.product_name = product_info[:name]
      scan.ingredients = product_info[:ingredients]
      result = diet.check_product(product_info[:ingredients])
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




end
