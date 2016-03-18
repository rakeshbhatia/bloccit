module UsersHelper
  def any_posts?(user)
    user.posts.size.not_nil?
  end

  def any_comments?(user)
    user.comments.size.not_nil?
  end
end
