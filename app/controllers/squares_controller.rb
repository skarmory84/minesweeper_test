class SquaresController < ApplicationController
  def update
    check_square
    response = @square.flip!

    if response
      if @square.asociated_item == "mine"
        @minefield.gameover
        return render json: { game_status: "YOU LOSE",  square: @square }
      else
        if @minefield.win?
          return render json: { game_status: "YOU WIN" }
        else
          squares = @square.empty_adjacent_squares
          return render json: { game_status: "GAME CONTINUE", squares: squares }
        end
      end
    else
      raise ActionController::BadRequest.new, "Cannot flip that square"
    end
  end

  def red_flag
    check_square
  end


  def question_mark
    check_square
  end

  private

  def check_square
    @minefield = Minefield.find_by(uuid: params[:uuid])
    @square = @minefield.squares.find_by(x_position: params[:x], y_position: params[:y])
    raise ActionController::BadRequest.new, "Invalid params" unless @square.valid?
    raise ActionController::BadRequest.new, "This game can't be continued" unless @minefield.can_continue?
  end
end