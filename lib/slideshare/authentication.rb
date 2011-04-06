module Slideshare
  # @private
  module Authentication
    private

    # Authentication hash
    #
    # @return [Hash]
    def authentication
      timestamp = Time.now.to_i.to_s
      {
        :api_key => api_key,
        :ts => timestamp,
        :hash => Digest::SHA1.hexdigest(api_secret + timestamp)
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
  end
end
