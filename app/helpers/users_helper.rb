module UsersHelper
  def any_posts?(user)
    user.posts.any?
  end

  def any_favorite_posts?(user)
    user.favorites.any?
  end

  def any_comments?(user)
    user.comments.any?
  end
end
