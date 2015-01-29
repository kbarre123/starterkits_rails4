module BusinessesHelper

  def cache_key_for_businesses(businesses)
    ids = businesses.map(&:id).join('-')
    max_updated_at = businesses.map(&:updated_at).max
    "businesses/#{ids}-#{max_updated_at.to_i}"
  end

end
