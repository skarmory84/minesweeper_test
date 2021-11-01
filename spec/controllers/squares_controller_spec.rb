require 'rails_helper'

RSpec.describe SquaresController, type: :request do

  describe "#flipping" do
    it "return continue game" do
      minefield = create(:minefield)
      square = minefield.squares.first
      square.asociated_item = "empty_space" #test propuse only
      square.save
      params = { x: square.x_position, y: square.y_position }
      put("/minefields/" + square.minefield.uuid + "/squares", params: params)
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("GAME CONTINUE")
    end

    it "return gameover" do
      minefield = create(:minefield)
      square = minefield.squares.first
      square.asociated_item = "mine" #test propuse only
      square.save
      params = { x: square.x_position, y: square.y_position }
      put("/minefields/" + square.minefield.uuid + "/squares", params: params)
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("YOU LOSE")
    end

    it "return you win" do
      minefield = create(:minefield)
      square = minefield.squares.first
      square.asociated_item = "empty_space" #test propuse only
      square.save
      minefield.mines_number = minefield.x_size * minefield.y_size - 1
      minefield.save
      params = { x: square.x_position, y: square.y_position }
      put("/minefields/" + square.minefield.uuid + "/squares", params: params)
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("YOU WIN")
    end
  end
end