class Dealership < ApplicationRecord
  #associations
  has_and_belongs_to_many :dealers
  belongs_to :admin, class_name: "Dealer", foreign_key: :admin_id
  has_many :models
  #validations
  validates :name, presence: true
end
