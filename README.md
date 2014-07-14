# PhantRb

A Ruby client for Phant. See [data.sparkfun.com](https://data.sparkfun.com/) for more information.

This is a work in progress.

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
client.log(22.7, 17.8)

data = client.get()
puts data
```

## Contributing

1. Fork it ( https://github.com/girishso/phant_rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



