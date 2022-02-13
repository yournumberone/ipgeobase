require "ipgeobase/version"
require 'json'
require 'httparty'

module Ipgeobase
  class Error < StandardError; end

    BASE_URL = "http://ip-api.com/json/"
    # принимает IP-адрес и возвращает объект метаданных
    def self.lookup(ip)
      url = BASE_URL + ip.to_s
      response = HTTParty.get(url).to_h
      
      response.each do |k, v|
        instance_variable_set "@#{k}", v
        response.define_singleton_method k do
          v
        end
      end
      response
    end
end