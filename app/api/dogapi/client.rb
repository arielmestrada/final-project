require 'httparty'

module Dogapi
  class Client
    def self.get_breeds
      Dogapi::Request.call('/breeds')
    end

    def self.search_breed(breed_name)
      Dogapi::Request.call('/breeds', breed_name)
    end

    def self.get_breed_image(breed_name)
      Dogapi::Request.call('/images', breed_name)
    end
  end
end
