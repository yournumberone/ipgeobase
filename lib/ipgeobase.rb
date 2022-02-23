require "ipgeobase/version"

require 'happymapper'
require 'faraday'
require 'faraday/net_http'



module Ipgeobase
  extend HappyMapper
  class Error < StandardError; end
  BASE_URL = "http://ip-api.com/xml/"

  def self.lookup(ip)
    conn = Faraday.new(BASE_URL) { |f| f.adapter :net_http }
    response = conn.get(ip.to_s)
    result = HappyMapper.parse(response.body)
  end
end