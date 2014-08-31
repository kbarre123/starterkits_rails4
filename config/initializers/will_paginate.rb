# ActiveAdmin needs 'kaminari' for pagination instead of 'will_paginate'.
# As a work-around, this file will create aliases for the kaminari functions.
if defined?(WillPaginate)
  ActiveSupport.on_load :active_record do
    module WillPaginate
      module ActiveRecord
        module RelationMethods
          def per(value = nil) per_page(value) end
          def total_count() count end
        end
      end
      module CollectionMethods
        alias_method :num_pages, :total_pages
      end
    end
  end
end