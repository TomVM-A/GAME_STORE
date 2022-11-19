class Booking < ApplicationRecord
  # esto es para que cuando se elimine en booking se eliminen las notificaciones
  has_noticed_notifications

  belongs_to :user
  belongs_to :game

  scope :user_bookings, ->(user) { where("user_id=?", user.id) }
  validate :date, on: :create

  def date
    if start_date.present? && start_date < Date.current
      return errors.add(:start_date, "No es posible seleccionar esta fecha")
    end
  end

  def notify_user
    BookingNotification.with(booking: self).deliver_later(user)
  end

end
