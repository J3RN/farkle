class GameController < ApplicationController

  def roll
    render json: Game.roll(params[:num_dice].to_i)
  end

  def point_value
    render json: Game.point_value(params[:values])
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
