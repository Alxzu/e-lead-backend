class Store < ApplicationRecord
  has_many :settings, dependent: :destroy

  validates :name, presence: true
  validates :identification, presence: true, length: { is: 5 }
end
