module Slideshare
  module Connection
    
    def get_slideshow(options={})
      # http://www.slideshare.net/api/2/get_slideshow
      response = get("/get_slideshow/", options)
    end
    
  end
end