# PhantRb

A Ruby client for Phant. See [data.sparkfun.com](https://data.sparkfun.com/) for more information.

[![Gem Version](https://badge.fury.io/rb/phant_rb.png)](http://badge.fury.io/rb/phant_rb)

## Installation

Add this line to your application's Gemfile:

    gem 'phant_rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phant_rb

## Usage

```ruby
client = PhantRb::Client.new "PUBLIC_KEY", %w(humidity temp), private_key: 'PRIVATE_KEY'

# log data, http://phant.io/docs/input/http/
client.log(22.7, 17.8)

# retrieve your data, http://phant.io/docs/output/http/
data = client.get()
puts data

# paginate data
data = client.get(page: 1)

# retrieve info about the current state of your stream, http://phant.io/docs/output/stats/
stats = client.stats()
puts stats.pageCount
puts stats.remaining

# retrieve rate limit for the current stream, http://phant.io/docs/input/limit/
# must be called only after PhantRb::Client#log is called
limits = client.rate_limits()
puts limits.x_rate_limit_remaining

# clear all logged data from a stream, http://phant.io/docs/management/clear/
client.clear()

```

To use different Phant server

```ruby
client = PhantRb::Client.new "PUBLIC_KEY", %w(humidity temp), {private_key: 'PRIVATE_KEY', base_url: 'http://127.0.0.1/'}
```

## TODO
* delete a stream
* use local server in specs

## Contributing

1. Fork it ( https://github.com/girishso/phant_rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Licence

MIT License

This software is provided as is, use it your own risk.

Brought to you by: [Cube Root Software](http://www.cuberoot.in) (c) 2014

