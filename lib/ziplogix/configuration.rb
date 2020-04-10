module Ziplogix

  class Configuration
    attr_accessor :api_url

    def initialize
      @api_url  = 'https://h5.zipformonline.com/api'
    end
  end

  class << self

    def configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def configure
      yield(configuration)
    end

  end
end
