class User < ApplicationRecord
  has_many :vans
  has_many :received_bookings, through: :vans, source: :bookings
  has_many :bookings
  validates :first_name, :last_name, presence: true, length: { minimum: 2}
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
