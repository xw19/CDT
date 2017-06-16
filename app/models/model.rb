class Model < ApplicationRecord
  belongs_to :car
  belongs_to :dealership
  has_many :pictures, as: :imageable

  validates :price, presence: true, numericality: { only_integer: true }
  validates :year, presence: true, numericality: { only_integer: true }
end
