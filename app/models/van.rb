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

  def available?(from, to)
    bookings.where('date_from <= ? AND date_until >= ?', to, from).none?
  end

end
