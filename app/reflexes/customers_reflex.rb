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

  def state
    facet do |filter|
      filter[:state] = element.value
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

  private

  def facet
    filter = CustomerFilter.find(element.dataset.filter)
    yield filter
    pagy, customers = pagy(filter.scope, page: filter.page, items: filter.items)
    morph "#customers", wrap(render(customers), customers)
    morph "#paginator", render(partial: "customers/paginator", locals: {pagy: pagy, filter: filter})
  end
end