class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user

  validates :date_from, presence: true
  validates :date_until, presence: true
end
