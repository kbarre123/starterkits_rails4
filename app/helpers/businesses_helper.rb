module BusinessesHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def cache_key_for_businesses(businesses, suffix = '')
    ids = businesses.map(&:id).join('-')
    max_updated_at = businesses.map(&:id).max
    "businesses/#{ids}-#{max_updated_at.to_i}#{suffix}"
  end

end
