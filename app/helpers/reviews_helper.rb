module ReviewsHelper
  def cache_key_for_reviews(reviews)
    ids = reviews.map(&:id).join('-')
    max_updated_at = reviews.map(&:updated_at).max
    "reviews/#{ids}-#{max_updated_at.to_i}"
  end
end
