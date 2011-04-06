require 'faraday'

# @private
module Faraday
  # @private
  class Response::RaiseHttp4xx < Response::Middleware
    def self.register_on_complete(env)
      env[:response].on_complete do |response|
        case response[:status].to_i
        when 400
          raise Slideshare::BadRequest, error_message(response)
        when 401
          raise Slideshare::Unauthorized, error_message(response)
        when 403
          raise Slideshare::Forbidden, error_message(response)
        when 404
          raise Slideshare::NotFound, error_message(response)
        when 406
          raise Slideshare::NotAcceptable, error_message(response)
        when 420
          raise Slideshare::EnhanceYourCalm.new error_message(response), response[:response_headers]
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
