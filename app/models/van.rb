class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :title, :description, :price, presence: true
  validates :description, length: { minimum: 20 }
end
