class SquaresController < ApplicationController
  def update
    minefield = Minefield.find_by(uuid: params[:uuid])
    square = minefield.squares.find_by(x_position: params[:x], y_position: params[:y])
    raise ActionController::BadRequest.new, "Invalid params" unless square.valid?
    raise ActionController::BadRequest.new, "This game can't be continued" unless minefield.can_continue?
    response = square.flip!

    if response
      if square.asociated_item == "mine"
        minefield.gameover
        return render json: { game_status: "YOU LOSE",  square: square }
      else
        if minefield.win?
          return render json: { game_status: "YOU WIN" }
        else
          squares = square.empty_adjacent_squares
          return render json: { game_status: "GAME CONTINUE", squares: squares }
        end
      end
    else
      raise ActionController::BadRequest.new, "Cannot flip that square"
    end
  end
end