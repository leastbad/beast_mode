class Customer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :stemmed, ->(query, threshold) {
    {
      query: query,
      against: {name: "A", email: "B", company: "B", age: "B", state: "C"}, 
      using: {
        tsearch: {prefix: true}, 
        trigram: {threshold: threshold, only: [:name]}
      }
    }
  }
  scope :search_for, ->(query, threshold) { stemmed(query, threshold) if query.present? }
  scope :with_state, ->(value) { where(state: value) if value.present? }
  scope :only_lawyers, ->(value) { where("company like ?", "% and %") if value }
  scope :between, ->(low, high) { where(age: low..high) if low && high }
end