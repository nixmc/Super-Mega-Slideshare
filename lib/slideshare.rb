require 'slideshare/error'
require 'slideshare/configuration'
require 'slideshare/client'
require 'slideshare/api'


module Slideshare
  extend Configuration
  
  # Alias for Slideshare::Client.new
  #
  # @return [Slideshare::Client]
  def self.client(options={})
    Slideshare::Client.new(options)
  end

  # Delegate to Slideshare::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Slideshare::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
  
end


