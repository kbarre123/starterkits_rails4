module BusinessesHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def cache_key_for_businesses
    count          = Business.count
    max_updated_at = Business.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "businesses/all-#{count}-#{max_updated_at}"
  end

end
