require 'rails_helper'

RSpec.describe MinefieldsController, type: :request do

  describe "#creating" do
    it "return a valid minesweeper" do
      params = { x_size: 10, y_size: 10, mines_number: 5 }
      post("/minefields", params: params)
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["squares"].size).to be(10*10)
    end

    it "return bad request" do
      params = { x_size: 0, y_size: 0 }
      expect {
        post("/minefields", params: params)
      }.to raise_error(ActionController::BadRequest)
    end

    it "return bad request" do
      params = { x_size: 10, y_size: 10, mines_number: 0 }
      expect {
        post("/minefields", params: params)
      }.to raise_error(ActionController::BadRequest)
    end
  end

  describe "#toggle pause/resume" do
    it "pauses the game" do
      minefield = create(:minefield)
      minefield.status = "playing" #for tests only
      minefield.save
      put("/minefields/" + minefield.uuid + "/toogle_pause_resume")
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("paused")
    end

    it "resumes the game" do
      minefield = create(:minefield)
      minefield.status = "paused" #for tests only
      minefield.save
      put("/minefields/" + minefield.uuid + "/toogle_pause_resume")
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("playing")
    end
  end

  describe "#end the game" do
    it "ends the game" do
      minefield = create(:minefield)
      delete("/minefields/" + minefield.uuid)
      expect(response).to have_http_status(:ok)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["game_status"]).to eq("YOU LOSE")
    end
  end
end