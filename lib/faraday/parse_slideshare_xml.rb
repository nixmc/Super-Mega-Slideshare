require 'faraday'

# @private
module Faraday
  # @private
  class Response::ParseSlideshareXml < Response::Middleware
    begin
      require 'multi_xml'
    rescue LoadError, NameError => error
      self.load_error = error
    end
    
    def self.register_on_complete(env)      
      # parse and raise either proper error or just return the response
      env[:response].on_complete do |response|
        response[:body] = begin
          puts "hello there"
          ::MultiXml.parser = :nokogiri
          xml = ::MultiXml.parse(response[:body])
          puts xml
        end
      end
    end

    def initialize(app)
      super
      @parser = nil
    end

    private

    def self.error_message(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{error_body(response[:body])}"
    end

    def self.error_body(body)
      if body.nil?
        nil
      elsif body['error']
        ": #{body['error']}"
      elsif body['errors']
        first = body['errors'].to_a.first
        if first.kind_of? Hash
          ": #{first['message'].chomp}"
        else
          ": #{first.chomp}"
        end
      end
    end
  end
end
