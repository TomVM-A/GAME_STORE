class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :game
  scope :user_bookings, ->(user) { where("user_id=?", user.id) }
  validate :date, on: :create

  def date
    if start_date.present? && start_date < Date.current
      return errors.add(:start_date, "No es posible seleccionar esta fecha")
    end
  end


end
