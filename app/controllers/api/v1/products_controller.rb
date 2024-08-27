class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.includes(:tags, :reviews, :dimension, :images).limit(params[:limit] || 50).offset(params[:skip] || 0)
  end

  def show
    @product = Product.includes(:tags, :reviews, :dimension, :images).find(params[:id])
  end
end
