class Dimension < ApplicationRecord
  belongs_to :product

  validates :width, :height, :depth, presence: true
end
