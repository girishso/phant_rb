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
      conn = rest_conn 'input'
      @last_response = conn.post URI.encode_www_form(@fields.zip(data))
      Hashie::Mash.new(JSON.parse(@last_response.body))
    end

    def get
      conn = rest_conn 'output'
      @last_response = conn.get
      puts @last_response.body
      JSON.parse @last_response.body
    end

    private
      def rest_conn(type)
        url = URI.join @opts[:base_url], "/#{type}/", "#{@public_key}.json"
        RestClient::Resource.new url.to_s,
          {:headers => {'Phant-Private-Key' => @opts[:private_key]}}
      end
  end
end
