class Business < ActiveRecord::Base
    #Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :category, presence: true
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

    #def self.search(search)
    #  if search
    #    where('title LIKE ?', "%#{search}%")
    #  else
    #    where(nil)
    #  end
    #end

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            flt_field: {
              title: {
                like_text: query,
                max_query_terms: 5,
                fuzziness: "AUTO"
              }
            }
          #  bool: {
          #    should: [
          #      {
          #        flt_field: {
          #          title: {
          #            like_text: query,
          #            max_query_terms: 5,
          #            fuzziness: "AUTO"
          #          }
          #        },
          #        flt_field: {
          #          category: {
          #            like_text: query,
          #            max_query_terms: 5,
          #            fuzziness: "AUTO"
          #          }
          #        }
          #      }
          #    ]
          #  }
          },
          highlight: {
            pre_tags: ['<em class="label label-highlight">'],
            post_tags: ['</em>'],
            fields: {
              title:   { number_of_fragments: 0 },
              category: { fragment_size: 0 }
            }
          }
        }
      )
    end

end
