class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :game
  scope :user_bookings, ->(user) { where("user_id=?", user.id) }
end
