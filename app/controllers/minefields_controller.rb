class MinefieldsController < ApplicationController

  def create
    minefield = Minefield.create(create_params)
    raise ActionController::BadRequest.new, "Invalid params" unless minefield.valid?

    render json: minefield.to_json(include: :squares)
  end

  def destroy
    minefield = Minefield.find_by(uuid: params[:uuid])
    minefield.status = "lost"
    minefield.save

    return render json: { game_status: "YOU LOSE" }
  end

  def toggle
    minefield = Minefield.find_by(uuid: params[:uuid])
    response = minefield.toggle
    raise ActionController::BadRequest.new, "Cannot toggle pause/resume" unless response

    render json: { game_status: minefield.status }
  end

  def create_params
    params.permit(
      :x_size,
      :y_size,
      :mines_number
    )
  end
end