class Setting < ApplicationRecord
  belongs_to :store

  validates :data, presence: true
end
