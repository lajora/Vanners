class Van < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings


  validates :title, :description, :price, presence: true
  validates :description, length: { minimum: 20 }
  validates :address, presence: true
end
