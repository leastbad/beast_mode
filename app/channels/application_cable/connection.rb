module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :session_id

    def connect
      self.session_id = request.session.id
      reject_unauthorized_connection unless session_id
    end
  end
end
