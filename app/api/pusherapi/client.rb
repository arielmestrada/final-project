module Pusherapi
  class Client
    def self.call
      require 'pusher'
      Pusher::Client.new(
        app_id: Rails.application.config.x.pusher_id,
        key: Rails.application.config.x.pusher_app_key,
        secret: Rails.application.config.x.pusher_secret,
        cluster: 'eu',
        encrypted: true
      )
    end
  end
end
