require 'faraday'

module Ziplogix

  class Client

    attr_reader :shared_key, :context_id

    def initialize(shared_key:, context_id: nil)
      @shared_key = shared_key
      @context_id = context_id
    end

    def connection
      @faraday ||= Faraday.new connection_options do |req|
        req.adapter :net_http
      end
    end

    def resources
      @resources ||= {}
    end

    def self.resources
      {
        authentication: AuthenticationResource,
        transactions: TransactionResource
      }
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection)
        resources[name]
      else
        super
      end
    end

    private

    def connection_options
      headers = { content_type: 'application/json' }
      unless @context_id.nil?
        headers.merge!({
          'X-Auth-ContextId' => @context_id,
          'X-Auth-SharedKey' => @shared_key
        })
      end

      {
        url: Ziplogix.configuration.api_url,
        headers: headers
      }
    end
  end
end
