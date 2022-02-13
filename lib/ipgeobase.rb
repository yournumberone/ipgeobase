require "ipgeobase/version"

require 'net/http'
require 'json'

module Ipgeobase
  class Error < StandardError; end

    BASE_URL = "http://ip-api.com/json/"
    # принимает IP-адрес и возвращает объект метаданных
    def self.lookup(ip)
      uri = BASE_URL + ip.to_s
      @url = URI.parse(uri)
      @answer_json = Net::HTTP.get(@url)
      @hashed_answer = JSON.parse(@answer_json)
      @hashed_answer.transform_keys! { |k| k.to_sym }
      @hashed_answer.each do |k, v|
        instance_variable_set "@#{k}", v
        @hashed_answer.define_singleton_method k do
          v
        end
      end
      @hashed_answer
    end
end