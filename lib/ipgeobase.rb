require "ipgeobase/version"
require 'json'
require 'httparty'

module Ipgeobase
  class Error < StandardError; end

    BASE_URL = "http://ip-api.com/json/"
    # принимает IP-адрес и возвращает объект метаданных
    def self.lookup(ip)
      p url = BASE_URL + ip.to_s
      p response = HTTParty.get(url).to_h
      response.each do |k, v|
        instance_variable_set "@#{k}", v
        response.define_singleton_method k do
          v
        end
      end
      p response
    end
end