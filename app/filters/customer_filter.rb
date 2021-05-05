class CustomerFilter < AllFutures
  attribute :search, :string
  attribute :status, :string
  attribute :lawyers, :boolean, default: false
  attribute :low, :integer, default: 21
  attribute :high, :integer, default: 65
  attribute :items, :integer, default: 10
  attribute :page, :integer, default: 1
  attribute :order, :string, default: "name"
  attribute :direction, :string, default: "asc"
  attribute :threshold, :float, default: 0.1

  def scope
    Customer
      .with_status(status)
      .only_lawyers(lawyers)
      .between(low, high)
      .order(order => direction)
      .search_for(search, threshold)
  end
end
