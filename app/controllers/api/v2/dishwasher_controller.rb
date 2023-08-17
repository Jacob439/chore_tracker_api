class Api::V2::DishwasherController < ApplicationController
  def index
    dishwasher_turns = Dishwasher_turn.all 
    render json: dishwasher_turns, status: 200
  end
  #NOTE: dishwasher is table, dishwasher_turn is entry
  #string Name, bool diff_order, timestamp
  def append
    dishwasher_turn = Dishwasher_turn.new(
      name: dish_params[:name],
      diff_order: dish_params[:diff_order]
    )
    if dishwasher_turn.save
      render json: dishwasher_turn, status:200
    else
      render json: {error: "Error appending turn."}
    end
  end

  def show
    dishwasher_turn = dishwasher_turn.find_by(id: params[:id])
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
        :diff_order
      ])
    end
end
