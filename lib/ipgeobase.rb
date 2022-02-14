require "ipgeobase/version"
require "addressable/uri"
require "json"
require "net/http"
module Ipgeobase
  class Error < StandardError; end

    BASE_URL = "http://ip-api.com/json/"
    # принимает IP-адрес и возвращает объект метаданных
    def self.lookup(ip)
      string = BASE_URL + ip.to_s
      uri = Addressable::URI.parse(string)
      response_string = Net::HTTP.get(uri)
      response = JSON.parse response_string
      response.transform_keys! { |k| k.to_sym }
      response.each do |k, v|
        instance_variable_set "@#{k}", v
        response.define_singleton_method k do
          v
        end
      end
      response
    end
end