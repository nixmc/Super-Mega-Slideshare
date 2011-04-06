require 'slideshare/connection'
require 'slideshare/request'
require 'slideshare/api'

module Slideshare
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Slideshare.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
    include Api
    include Authentication
    
    
  end
end