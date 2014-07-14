require "phant_rb/version"
require 'rest_client'
require 'pp'
require 'hashie'

module PhantRb
  class Client
    def initialize(public_key, fields, opts = {})
      @opts = {
        base_url: 'http://data.sparkfun.com/'
      }.merge(opts)
      @fields = fields
      @public_key = public_key
    end

    def log(*data)
      @last_response = request data
      Hashie::Mash.new(JSON.parse(@last_response.body))
    end

    def get
      res = RestClient::Resource.new @opts[:base_url] + "output/" + @public_key + ".json",
           'Phant-Private-Key' => @opts[:private_key]
      @last_response = res.get
      JSON.parse @last_response.body
    end

    private
      def request(data)
        RestClient.post(
           @opts[:base_url] + "input/" + @public_key + ".json",
           URI.encode_www_form(@fields.zip(data)),
           'Phant-Private-Key' => @opts[:private_key]
        )
      end
  end
end
