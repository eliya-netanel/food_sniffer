class ScansController < ApplicationController
   # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!#, only: [:home]
  def new
    @scan = Scan.new
    # @food_item = FoodIten.new
    # @food_item.upc = params[:upc]
    # redirect_to create_path
    # raise
  end

  # def get_barcode
  #   # @scan.barcode =
  #   # @food_item = FoodIten.find_or_initialize_by(upc: params[:upc])
  #   # unless @product.new.record?
  #     # redirect_to scan_path(@food_item)
  #   # end
  # end

  def create
    raise
    redirect_to root_path
    @scan = Scan.new
    @scan.user = current_user
    @scan.result = call_to_api
    @scan.save
  end

  def show
  end
end
