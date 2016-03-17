module UsersHelper
  def any_posts_or_comments?
    current_user && (current_user.posts.size != 0 || current_user.comments.size != 0)
  end
end
