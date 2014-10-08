module ReviewsHelper
    def cache_key_for_reviews
      count          = Review.count
      max_updated_at = Review.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "reviews/all-#{count}-#{max_updated_at}"
    end
end
