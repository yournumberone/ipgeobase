require "test_helper"


class IpgeobaseTest < Minitest::Test
  FIXTURES = ["77.88.21.37", "206.190.36.45"]
  
  def setup
    FIXTURES.each do |ip|
    stub_request(:get, "http://ip-api.com/xml/#{ip}").
  with(
    headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.2.0'
    }).to_return(status: 200, body: read_fixture(ip), headers: {})
    Ipgeobase.lookup("#{ip}")
    end
  end

  def test_that_methods_return_data
    meta = Ipgeobase.lookup("77.88.21.37")
    assert_equal(meta.country, "Russia")
    assert_equal(meta.org, "Yandex LLC")
  end

  def read_fixture(ip)
    File.read("./test/fixtures/#{ip}.xml")
  end
end