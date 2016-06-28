require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_post) { create(:post) }
  let(:my_user) { create(:user) }

  describe "GET #index" do
    it "returns a 200 status" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      before do
        @new_post = build(:post)
        put :update, id: my_post.id, post: { title: @new_post.title, body: @new_post.body, topic: @new_post.topic, user: my_user, rank: 0.0 }
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["title"]).to eq(@new_post.name)
        expect(hashed_json["body"]).to eq(@new_post.email)
        expect(hashed_json["topic"]).to eq(@new_post.topic)
        expect(hashed_json["user"]).to eq(my_user)
        expect(hashed_json["rank"]).to eq(0.0)
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: my_post.id, post: { title: "My Post", body: "Post Body", topic: "Post Topic", user: my_user, rank: 0.0 }
      end

      it "returns http error" do
        expect(response).to have_http_status(400)
      end

      it "returns the correct json error message" do
        expect(response.body).to eq({ error: "Post update failed", status: 400 }.to_json)
      end
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      before do
        @new_post = build(:post)
        post :create, post: { title: @new_post.title, body: @new_post.body, topic: @new_post.topic, user: my_user, rank: 0.0 }
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["title"]).to eq(@new_post.name)
        expect(hashed_json["body"]).to eq(@new_post.email)
        expect(hashed_json["topic"]).to eq(@new_post.topic)
        expect(hashed_json["user"]).to eq(my_user)
        expect(hashed_json["rank"]).to eq(0.0)
      end
    end

    context "with invalid attributes" do
      before do
        post :create, post: { title: "New Post", body: "Post Body", topic: "Post Topic", user: my_user, rank: 0.0 }
      end

      it "returns http error" do
        expect(response).to have_http_status(400)
      end

      it "returns the correct json error message" do
        expect(response.body).to eq({ "error": "Post is invalid", "status": 400 }.to_json)
      end
    end
  end
end
