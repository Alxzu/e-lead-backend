class Store < ApplicationRecord
  has_many :settings, dependent: :destroy
  has_many :products

  validates :name, presence: true
  validates :identification, presence: true, length: { is: 5 }
end
