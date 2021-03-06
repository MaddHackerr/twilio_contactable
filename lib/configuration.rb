module TwilioContactable
  class << self
    def mode
      @@mode ||= :test
    end

    def mode=(new_mode)
      @@mode = new_mode
    end

    def configured?
      return false unless configuration
      configuration.client_id && configuration.client_key
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure(&block)
      @configuration = Configuration.new(&block)
    end
  end

  class Configuration

    attr_accessor :client_id
    attr_accessor :client_key
    attr_accessor :website_address
    attr_accessor :default_from_phone_number

    def initialize
      yield self
    end
  end
end