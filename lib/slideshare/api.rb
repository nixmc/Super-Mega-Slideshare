module Slideshare
  module Api
    
    def get_slideshow(options={})
      # http://www.slideshare.net/api/2/get_slideshow
      response = get("get_slideshow/", options, true)
    end
    
  end
end