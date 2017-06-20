class Model < ApplicationRecord
  belongs_to :car
  belongs_to :dealership
  has_many :pictures, as: :imageable

  validates :price, presence: true, numericality: { only_integer: true }
  validates :year, presence: true, numericality: { only_integer: true }


  def master_picture
    if pictures.any?
      return "https://cartruckdealerships.herokuapp.com" + pictures.first.image_url
    end
    "https://lorempixel.com/400/300/transport/3/"
  end
end
