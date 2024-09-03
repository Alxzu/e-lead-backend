class Api::V1::ProductsController < ApplicationController
  def index
    # puts "request.host: #{request.host}, request.headers: #{request.headers['Origin']}"
    Rails.logger.info("request.host: #{request.host}, request.headers: #{request.headers['Origin']}")
    store = Store.find_by(host_name: request.headers["Origin"])
    if store
      @products = Product.includes(:tags, :reviews, :dimension, :images).where(store:)
      # puts "products filter by store: #{request.headers['Origin']}"
      Rails.logger.info("#{@products.count} products filter by store: #{request.headers['Origin']}")
      @products
    else
      # puts "all products"
      Rails.logger.info("all products")
      @products = Product.includes(:tags, :reviews, :dimension, :images)
    end
  end

  def show
    @product = Product.includes(:tags, :reviews, :dimension, :images).find(params[:id])
  end
end
