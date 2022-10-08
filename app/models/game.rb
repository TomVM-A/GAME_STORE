class Game < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user, dependent: :destroy
  belongs_to :category
end
