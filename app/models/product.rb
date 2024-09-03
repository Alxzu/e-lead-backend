class Product < ApplicationRecord
  has_one :dimension, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :store

  validates :title, :description, :category, :price, :brand, :sku, presence: true
end
