module PostsHelper
  def cache_key_for_posts(posts)
    ids = posts.map(&:id).join('-')
    max_updated_at = posts.map(&:id).max
    "posts/#{ids}-#{max_updated_at.to_i}"
  end
end
