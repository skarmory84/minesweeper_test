require 'rails_helper'

RSpec.describe MinefieldsController, type: :request do

  describe "#creating" do
    it "return a valid minesweeper" do
      params = { x_size: 10, y_size: 10 }
      post("/minefields", params: params)
      expect(response).to have_http_status(:ok)
    end

    it "return bad request" do
      params = { x_size: 0, y_size: 0 }
      expect {
        post("/minefields", params: params)
      }.to raise_error(ActionController::BadRequest)
    end
  end
end