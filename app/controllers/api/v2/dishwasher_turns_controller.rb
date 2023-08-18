class Api::V2::DishwasherTurnsController < ApplicationController
  def index
    dishwasher_turns = DishwasherTurn.all 
    render json: dishwasher_turns, status: 200
  end
  #NOTE: dishwasher is table, dishwasher_turn is entry
  #string Name, bool diff_order, timestamp
  def create
    dishwasher_turn = DishwasherTurn.new(
      name: dish_params[:name],
      inorder: dish_params[:inorder]
    )
    if dishwasher_turn.save
      render json: dishwasher_turn, status:200
    else
      render json: {error: "Error appending turn."}
    end
  end

  def show
    dishwasher_turn = DishwasherTurn.find_by(id: params[:id])
    if dishwasher_turn
      render json: dishwasher_turn, status: 200
    else
      render json: {error: "Turn not found."}
    end
  end
  private
    def dish_params
      params.require(:dishwasher_turn).permit([
        :name,
        :inorder
      ])
    end
end

