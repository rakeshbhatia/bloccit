module UsersHelper
  def any_posts?(user)
    user.posts.any?
  end

  def any_comments?(user)
    user.comments.size.not_nil?
  end
end
