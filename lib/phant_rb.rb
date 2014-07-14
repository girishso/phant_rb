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
      response = conn.get
      JSON.parse response.body
    end

    def stats
      conn = rest_conn 'stats'
      response = conn.get
      Hashie::Mash.new(JSON.parse(response.body))
    end

    def clear
      conn = rest_conn 'input'
      response = conn.delete
      Hashie::Mash.new(JSON.parse(response.body))
    end

    def rate_limits
      unless !@last_response.nil? && @last_response.headers.has_key?(:x_rate_limit_remaining)
        raise "No rate limit headers found. PhantRb::Client#log must be called before this."
      end
      Hashie::Mash.new(@last_response.headers)
    end

    private
      def rest_conn(type)
        url = case type
              when 'stats' then URI.join @opts[:base_url], "/output/", "#{@public_key}/stats.json"
              else  URI.join @opts[:base_url], "/#{type}/", "#{@public_key}.json"
              end
        RestClient::Resource.new url.to_s,
          {:headers => {'Phant-Private-Key' => @opts[:private_key]}}
      end
  end
end
