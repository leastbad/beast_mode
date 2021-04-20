module ApplicationCable
  class Channel < ActionCable::Channel::Base
    include CableReady::Broadcaster
    delegate :render, to: :ApplicationController
  end
end
