module Slideshare
  # Custom error class for rescuing from all SlideShare errors
  class Error < StandardError; end

  # Raised when SlideShare returns the HTTP status code 400
  class BadRequest < Error; end

  # Raised when SlideShare returns the HTTP status code 401
  class Unauthorized < Error; end

  # Raised when SlideShare returns the HTTP status code 403
  class Forbidden < Error; end

  # Raised when SlideShare returns the HTTP status code 404
  class NotFound < Error; end

  # Raised when SlideShare returns the HTTP status code 406
  class NotAcceptable < Error; end

  # Raised when SlideShare returns the HTTP status code 500
  class InternalServerError < Error; end

  # Raised when SlideShare returns the HTTP status code 502
  class BadGateway < Error; end

  # Raised when SlideShare returns the HTTP status code 503
  class ServiceUnavailable < Error; end
  
  # Raised when SlideShare returns any other error from its API
  class SlideshareError < Error; end
end
