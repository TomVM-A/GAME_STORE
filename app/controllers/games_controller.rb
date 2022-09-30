class GamesController < ApplicationController

  before_action :set_game, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(params[game_params])  #Por que se declara una variable global?
    game.save
    redirect_to game_path(game) #Falta añadir que redirecione al perfil de la persona que lo creò, tengo que tener en cuenta las rutas que va a crear Thomas porque hay que tener en cuenta el usuario
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(game) #Falta añadir que redirecione al perfil de la persona que lo creò, tengo que tener en cuenta las rutas que va a crear Thomas porque hay que tener en cuenta el usuario
  end

  def destroy
    @game.destroy
    redirect_to game_path(game) #Falta añadir que redirecione al perfil de la persona que lo creò, tengo que tener en cuenta las rutas que va a crear Thomas porque hay que tener en cuenta el usuario
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :price, :image, :categor) #Falta agregar una referencia a users ya que cada juego està relacionado a una persona que lo sibiò
  end
end
