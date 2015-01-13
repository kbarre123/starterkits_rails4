class Business < ActiveRecord::Base
    include Elasticsearch::Model #or "ES"
    #include Elasticsearch::Model::Callbacks
    belongs_to :category

    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :category_id, presence: true
    validates :street, presence: true
    validates :map_heading, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    validates :state, presence: true
    validates :telephone, presence: true
    validates_associated :reviews

    geocoded_by :map_address
    after_validation :geocode

    def map_address
      "#{self.street} #{self.city} #{self.state}, #{self.zip_code}"
    end

    # Search query for ES
    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            fuzzy_like_this: { 
              like_text: query,
              fields: ["title"],
              fuzziness: "AUTO"
            }
          },
          highlight: {
            pre_tags: ['<em class="label label-highlight">'],
            post_tags: ['</em>'],
            fields: {
              title:   { number_of_fragments: 1 }
            }
          }
        }
      )
    end
    
    # Update ES index upon model CRUD
    after_commit on: [:create] do
      index_document if self.published?        
    end

    after_commit on: [:update] do
      update_document if self.published?        
    end

    after_commit on: [:destroy] do
      delete_document if self.published?        
    end

    #scope :category, lambda { |category| joins(:category).where('category.name = ?', category) }
    scope :by_category, -> category { where(category.name => category) }
end
