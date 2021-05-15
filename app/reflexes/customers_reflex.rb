class CustomersReflex < ApplicationReflex
  def paginate
    facet do |filter|
      filter[:page] = element.dataset.page
    end
  end

  def items
    facet do |filter|
      filter[:items] = element.dataset.items
    end
  end

  def search
    facet do |filter|
      filter[:search] = element.value
    end
  end

  def status
    facet do |filter|
      filter[:status] = element.value
    end
  end

  def lawyers
    facet do |filter|
      filter[:lawyers] = element.checked
    end
  end

  def low
    facet do |filter|
      filter[:low] = element.value
    end
  end

  def high
    facet do |filter|
      filter[:high] = element.value
    end
  end

  def sort
    facet do |filter|
      filter[:order] = element.dataset.order
      filter[:direction] = element.dataset.direction
    end
  end

  def threshold
    facet do |filter|
      filter[:threshold] = element.checked ? 0.3 : 0.1
    end
  end

  private

  def facet
    filter = CustomerFilter.find(element.dataset.filter)
    yield filter
    pagy, customers = pagy(filter.scope, page: filter.page, items: filter.items)
    morph customers
    morph "#paginator", render(partial: "customers/paginator", locals: {pagy: pagy, filter: filter})
  end
end
