module ApplicationHelper
  include Pagy::Frontend

  def color
    {"Active" => "success", "Inactive" => "info", "Pending" => "warning", "Suspended" => "danger"}
  end
end
