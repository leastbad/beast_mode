class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include CableReady::Broadcaster
  delegate :render, to: :ApplicationController

  def sgid
    to_sgid(expires_in: nil).to_s
  end
end
