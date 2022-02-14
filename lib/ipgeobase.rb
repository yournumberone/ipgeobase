require "ipgeobase/version"

require "json"
require 'faraday'
require 'faraday/net_http'



module Ipgeobase
  class Error < StandardError; end

    @base_url = "http://ip-api.com/json/"
    # принимает IP-адрес и возвращает объект метаданных
    def self.lookup(ip)
      # string = @base_url + ip.to_s
      conn = Faraday.new(@base_url) do |f|
        f.request :json # encode req bodies as JSON
        f.adapter :net_http # Use the Net::HTTP adapter
      end
      response = conn.get(ip.to_s)
      result = JSON.parse(response.body)

      result.each do |k, v|
        instance_variable_set "@#{k}", v
        result.define_singleton_method k do
          v
        end
      end
      result
    end
end