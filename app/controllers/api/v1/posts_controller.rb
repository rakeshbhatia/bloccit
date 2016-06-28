class Api::V1::PostsController < Api::V1::BaseController

  def update
    topic = Topic.find(params[:topic_id])
    post = topic.posts.find(params[:id])

    if post.update_attributes(post_params)
      render json: user, status: 200
    else
      render json: { error: "Post update failed", status: 400 }, status: 400
    end
  end

  def create
    topic = Topic.find(params[:topic_id])
    post = topic.posts.new(post_params)
    post.user = current_user

            binding.pry
    if post.valid?
      post.save!
      render json: post, status: 201
    else
      render json: { error: "Post is invalid", status: 400 }, status: 400
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :rank)
  end
end
