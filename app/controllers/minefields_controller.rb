class MinefieldsController < ApplicationController

  def create
    minefield = Minefield.create(create_params)
    raise ActionController::BadRequest.new, "Invalid params" unless minefield.valid?
    render json: minefield
  end

  def create_params
    params.permit(
      :x_size,
      :y_size
    )
  end
end