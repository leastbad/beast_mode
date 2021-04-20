class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  include Pagy::Backend
end
