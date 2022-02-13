# Ipgeobase

Welcome to Ipgeobase gem!

Find the company and their geolocation by IP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase

## Usage

$ ip_meta = Ipgeobase.lookup('8.8.8.8')
$ ip_meta.city # Ashburn
$ ip_meta.country # United States
$ ip_meta.countryCode # US
$ ip_meta.lat # 39.03
$ ip_meta.lon= # -77.5
$ ip_meta # full hash
$ ip_meta.timezone # "America/New_York"
$ ip_meta.org #	"Google Public DNS"
$ ip_meta.regionName # "Virginia"
and more
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yournumberone/ipgeobase.

