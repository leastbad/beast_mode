class Customer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :stemmed,
    against: {name: "A", email: "B", company: "B", age: "B", state: "C"}, 
    using: {
      tsearch: {prefix: true}, 
      trigram: {threshold: 0.1, only: [:name]}
    }
  scope :search_for, ->(value) { stemmed(value) if value.present? }
  scope :with_state, ->(value) { where(state: value) if value.present? }
  scope :only_lawyers, ->(value) { where("company like ?", "% and %") if value }
  scope :between, ->(low, high) { where(age: low..high) if low && high }
end