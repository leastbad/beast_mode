class CustomersController < ApplicationController
  def index
    @filter = CustomerFilter.create
    @pagy, @customers = pagy(@filter.scope, limit: @filter.items)
  end
end
