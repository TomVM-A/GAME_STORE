class BookingsController < ApplicationController

  before_action :set_booking, only: [:destroy, :show]
  before_action :set_game, only: [:new, :create]
  before_action :set_user, only: [:index, :create]

  def index
    @booking = Booking.user_bookings(@user)
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def create
    @booking = Bookings.new(booking_params)
    @booking.game = @game
    @booking.user = @user
    if @booking.save
      rendirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    rendirect_to game_path(@booking.game), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :game_id, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_game
    @games = Game.find(params[:game_id])
  end

  def set_user
    @user = current_user
  end
end
