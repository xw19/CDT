class Dealer < ApplicationRecord
  has_and_belongs_to_many :dealerships
  has_many :dealership_admins, class_name: "Dealership",
            foreign_key: :admin_id, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
