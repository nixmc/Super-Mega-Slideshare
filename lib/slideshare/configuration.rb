require 'faraday'
require 'slideshare/version'

module Slideshare
  module Configuration
    VALID_OPTIONS_KEYS = [
      :version,
      :api_key,
      :api_secret,
      :http_endpoint,
      :https_endpoint,
      :format,
      :user_agent
    ].freeze
    
    VALID_FROMATS = [:xml].freeze
    
    DEFAULT_VERSION = "2".freeze
    DEFAULT_API_KEY = nil
    DEFAULT_API_SECRET = nil
    DEFAULT_HTTP_ENDPOINT = "http://www.slideshare.net/api/".freeze
    DEFAULT_HTTPS_ENDPOINT = "https://www.slideshare.net/api/".freeze
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
      self.version        = DEFAULT_VERSION
      self.api_key        = DEFAULT_API_KEY
      self.api_secret     = DEFAULT_API_SECRET
      self.http_endpoint  = DEFAULT_HTTP_ENDPOINT
      self.https_endpoint = DEFAULT_HTTPS_ENDPOINT
      self.format         = DEFAULT_FORMAT
      self.user_agent     = DEFAULT_USER_AGENT
      self
    end
    
  end
end