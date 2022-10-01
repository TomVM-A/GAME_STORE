class BookingsController < ApplicationController

  before_action :set_booking, only: :destroy
  before_action :set_gams, only: [:new, :create]

  def new
    @booking = Boooking.new
  end

  def create
    @booking = Bookings.new(booking_params)
    @booking.game = @game
  end

  private

  def set_bookings

  end

  def set_games

  end
end
