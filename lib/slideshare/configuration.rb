require 'faraday'
require 'slideshare/version'

module Slideshare
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :version,
      :api_key,
      :api_secret,
      :api_endpoint,
      :http_endpoint,
      :https_endpoint,
      :format,
      :user_agent
    ].freeze
    
    VALID_FROMATS = [:xml].freeze
    
    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_VERSION = "2".freeze
    DEFAULT_API_KEY = nil
    DEFAULT_API_SECRET = nil
    DEFAULT_API_ENDPOINT = "https://www.slideshare.net/api/2/".freeze
    DEFAULT_FORMAT = :xml
    DEFAULT_USER_AGENT = "Slideshare Rub Gem #{Slideshare::VERSION}".freeze
    
    
    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end
    
    # Create a hash of options and their values
    def options
      Hash[VALID_OPTIONS_KEYS.map {|key| [key, send(key)] }]
    end
    
    # Reset all configuration options to defaults
    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.version        = DEFAULT_VERSION
      self.api_key        = DEFAULT_API_KEY
      self.api_secret     = DEFAULT_API_SECRET
      self.api_endpoint   = DEFAULT_API_ENDPOINT
      self.format         = DEFAULT_FORMAT
      self.user_agent     = DEFAULT_USER_AGENT
      self
    end
    
  end
end