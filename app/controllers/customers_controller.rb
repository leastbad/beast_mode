class CustomersController < ApplicationController
  def index
    @filter = CustomerFilter.new
    @pagy, @customers = pagy(@filter.scope)
  end
end
