class CustomersController < ApplicationController
  def index
    @filter = CustomerFilter.create
    @pagy, @customers = pagy(@filter.scope)
  end
end
