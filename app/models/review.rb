class Review < ApplicationRecord
  belongs_to :product

  validates :rating, :comment, :reviewer_name, :reviewer_email, presence: true
end
