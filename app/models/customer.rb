class Customer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :stemmed, lambda { |query, threshold|
    {
      query: query,
      against: { name: 'A', email: 'B', bio: 'B', company: 'B', age: 'B', status: 'C' },
      using: {
        tsearch: { prefix: true,
                   tsvector_column: 'tsv' },
        trigram: { threshold: threshold, only: [:name] }
      }
    }
  }

  scope :search_for, ->(query, threshold) { stemmed(query, threshold) if query.present? }
  scope :with_status, ->(status) { where(status: status) if status.present? }
  scope :only_lawyers, ->(lawyers) { where('company like ?', '% and %') if lawyers }
  scope :between, ->(low, high) { where(age: low..high) }
end
