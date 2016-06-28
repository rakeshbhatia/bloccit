require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_post) { create(:post) }
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }

  before do
    controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
  end

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
        put :update, id: my_post.id, post: {
          title: @new_post.title,
          body: @new_post.body,
          rank: 0.0
        }, topic_id: my_topic.id
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "updates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["title"]).to eq(@new_post.title)
        expect(hashed_json["body"]).to eq(@new_post.body)
        expect(hashed_json["rank"]).to eq(0.0)
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: my_post.id, topic_id: my_topic.id, post: { title: "My Post", body: "Post Body", rank: 0.0 }
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
        post :create, topic_id: my_topic.id, post: { title: @new_post.title, body: @new_post.body, rank: 0.0 }
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.content_type).to eq 'application/json'
      end

      it "creates a post with the correct attributes" do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json["title"]).to eq(@new_post.title)
        expect(hashed_json["body"]).to eq(@new_post.body)
        expect(hashed_json["rank"]).to eq(0.0)
      end
    end

    context "with invalid attributes" do
      before do
        post :create, topic_id: my_topic.id, post: { title: "New Post", body: "Post Body", user: my_user, rank: 0.0 }
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
