module CommentsHelper
  def cache_key_for_comments(comments)
    ids = comments.map(&:id).join('-')
    max_updated_at = comments.map(&:updated_at).max
    "comments/#{ids}-#{max_updated_at.to_i}"
  end
end
