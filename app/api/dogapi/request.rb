require 'httparty'

module Dogapi
  class Request
    include HTTParty
    base_uri 'api.thedogapi.com/v1'
    headers 'x-api-key' => Rails.application.config.x.dogapi.token

    def self.call(endpoint, query = nil)
      if query.nil?
        get("#{endpoint}")
      else
        get("#{endpoint}/search?q=#{query}")
      end
    end
  end
end
