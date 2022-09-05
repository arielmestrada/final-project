module Pusherapi
  class Client
    def self.call
      require 'pusher'
      Pusher::Client.new(
        app_id: '1471758',
        key: '144480ed232e81e5c86c',
        secret: '3bf3d3ef1ef9759e0864',
        cluster: 'eu',
        encrypted: true
      )
    end
  end
end
