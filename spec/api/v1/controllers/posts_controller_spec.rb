require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  describe "GET #index" do
    it "returns a 200 status" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
