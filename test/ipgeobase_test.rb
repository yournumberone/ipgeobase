require "test_helper"

class IpgeobaseTest < Minitest::Test


  def setup
    yandex = File.new("./test/yandex.json")
    stub_request(:get, "http://ip-api.com/json/77.88.21.37").
  with(
    headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.2.0'
    }).to_return(status: 200, body: File.open(yandex), headers: {})
    meta = Ipgeobase.lookup("77.88.21.37")
  end

  def test_do
    meta = Ipgeobase.lookup("77.88.21.37")
    assert_equal(meta.country, "Russia")
  end



end