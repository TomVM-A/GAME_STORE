class GamesController < ApplicationController

  before_action :set_game, only: [:create, :show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(game)
  end

  def destroy
    @game.destroy
    redirect_to game_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :price, :image, :categor)
  end
end
