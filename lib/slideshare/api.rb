module Slideshare
  module Api
    
    
    # Authorization: Optional
    # URL: http://www.slideshare.net/api/2/get_slideshow
    # Required parameters:
    # * slideshow_id: ID of the slideshow to be fetched.
    # * slideshow_url: URL of the slideshow to be fetched. This is required if slideshow_id is not set. If both are set, slideshow_id takes precedence.
    # Optional parameters
    # * username: Username of the requesting user
    # * password: Password of the requesting user
    # * exclude_tags: Exclude tags from the detailed information. 1 to exclude.
    # * detailed: Whether or not to include optional information. 1 to include, 0 (default) for basic information.
    def get_slideshow(options={})
      response = get("get_slideshow/", options)
    end
    
    
    # Authorization: None
    # URL: http://www.slideshare.net/api/2/get_slideshows_by_tag
    # Required parameters:
    # * tag: Tag name
    # Optional: parameters
    # * limit: Specify number of items to return
    # * offset: Specify offset
    # * detailed: Whether or not to include optional information. 1 to include, 0 (default) for basic information.
    def get_slideshows_by_tag(options={})
      response = get("get_slideshows_by_tag/", options)
    end
    
    # Authorization: None
    # URL http://www.slideshare.net/api/2/get_slideshows_by_group
    # Required parameters
    # * group_name: Group name (as returned in QueryName element in get_user_groups method)
    # Optional parameters
    # * limit: Specify number of items to return
    # * offset: Specify offset
    # * detailed: Whether or not to include optional information. 1 to include, 0 (default) for basic information.
    def get_slideshows_by_group(options={})
      response = get("get_slideshows_by_group/", options)
    end
    
    # Authorization: None
    # URL: http://www.slideshare.net/api/2/get_slideshows_by_user
    # Required parameters:
    # * username_for username of owner of slideshows
    # Optional parameters:
    # * username username of the requesting user
    # * password password of the requesting user
    # * limit specify number of items to return
    # * offset specify offset
    # * detailed Whether or not to include optional information. 1 to include, 0 (default) for basic information.
    # * get_unconverted Whether or not to include unconverted slideshows. 1 to include them, 0 (default) otherwise.
    def get_slideshows_by_user(options={})
      response = get("get_slideshows_by_user/", options)
    end
    
    # Authorization: None
    # URL: http://www.slideshare.net/api/2/search_slideshows
    # Required parameters:
    # * q: the query string
    # Optional parameters:
    # * page: The page number of the results (works in conjunction with items_per_page), default is 1
    # * items_per_page: Number of results to return per page, default is 12
    # * lang: Language of slideshows (default is English, 'en') ('**':All,'es':Spanish,'pt':Portuguese,'fr':French,'it':Italian,'nl':Dutch, 'de':German,'zh':Chinese,'ja':Japanese,'ko':Korean,'ro':Romanian, '!!':Other)
    # * sort: Sort order (default is 'relevance') ('mostviewed','mostdownloaded','latest')
    # * upload_date: The time period you want to restrict your search to. 'week' would restrict to the last week. (default is 'any') ('week', 'month', 'year')
    # * what: What type of search. If not set, text search is used. 'tag' is the other option.
    # * download: Slideshows that are available to download; Set to '0' to do this, otherwise default is all slideshows.
    # * fileformat: File format to search for. Default is "all". ('pdf':PDF,'ppt':PowerPoint,'odp':Open Office,'pps':PowerPoint Slideshow,'pot':PowerPoint template)
    # * file_type: File type to search for. Default is "all". ('presentations', 'documents', 'webinars','videos')
    # * cc: Set to '1' to retrieve results under the Creative Commons license. Default is '0'
    # * cc_adapt: Set to '1' for results under Creative Commons that allow adaption, modification. Default is '0'
    # * cc_commercial: Set to '1' to retrieve results with the commercial Creative Commons license. Default is '0'
    # * detailed: Whether or not to include optional information. 1 to include, 0 (default) for basic information.
    def search_slideshows(options={})
      response = get("search_slideshows/", options)
    end
    
    # Authorization: Optional
    # URL: http://www.slideshare.net/api/2/get_user_groups
    # Required parameters:
    # * username_for: Username of user whose groups are being requested
    # Optional parameters:
    # * username: Username of the requesting user
    # * password: Password of the requesting user
    def get_user_groups(options={})
      response = get("get_user_groups/", options)
    end
    
    # Authorization: Optional
    # URL: http://www.slideshare.net/api/2/get_user_contacts
    # Required parameters:
    # * username_for: username of user whose Contacts are being requested
    # Optional parameters:
    # * limit: Specify number of items to return
    # * offset: Specify offset
    def get_user_contacts(options={})
      response = get("get_user_contacts/", options)
    end
    
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/get_user_tags
    # Required parameters:
    # username: Username of the requesting user
    # password: Password of the requesting user
    def get_user_tags(options={})
      response = get("get_user_tags/", options)
    end
    
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/edit_slideshow
    # Required parameters:
    # * username: Username of the requesting user
    # * password: Password of the requesting user
    # * slideshow_id: Slideshow ID
    # Optional parameters:
    # * slideshow_title: Text
    # * slideshow_description: Text
    # * slideshow_tags: Text
    # * make_slideshow_private: Should be Y if you want to make the slideshow private. If this is not set, following tags will not be considered
    # * generate_secret_url: Generate a secret URL for the slideshow. Requires make_slideshow_private to be Y
    # * allow_embeds: Sets if other websites should be allowed to embed the slideshow. Requires make_slideshow_private to be Y
    # * share_with_contacts: Sets if your contacts on SlideShare can view the slideshow. Requires make_slideshow_private to be Y
    def edit_slideshow(options={})
      response = get("edit_slideshow/", options)
    end
    
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/delete_slideshow
    # Required parameters:
    # * username: username of the requesting user
    # * password: password of the requesting user
    # * slideshow_id: slideshow ID
    def delete_slideshow(options={})
      response = get("delete_slideshow/", options)
    end
    
    # Not quite working yet, need to figure out best way to handle uploads.
    # Get versions with upload_url set should work ok though
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/upload_slideshow
    # Required parameters:
    # * username: Username of the requesting user
    # * password: Password of the requesting user
    # * slideshow_title: Slideshow's title
    # * slideshow_srcfile: Slideshow file (requires HTTP POST)
    # -OR-
    # * upload_url: string containing an url pointing to the power point file: ex: http://domain.tld/directory/my_power_point.ppt
    #   The following urls are also acceptable
    #     http://www.domain.tld/directory/file.ppt
    #     http://www.domain.tld/directory/file.cgi?filename=file.ppt
    # 
    #   Note, that this will not accept entries that cannot be identified by their extension. If you sent
    #   http://www.domain.tld/directory/file.cgi?id=2342
    #   We will not be able to identify the type of the file!
    # Optional parameters
    # * slideshow_description: description
    # * slideshow_tags: tags should be comma separated
    # * make_src_public: Y if you want users to be able to download the ppt file, N otherwise. Default is Y
    # Privacy settings (optional):
    # * make_slideshow_private: Should be Y if you want to make the slideshow private. If this is not set, following tags will not be considered
    # * generate_secret_url: Generate a secret URL for the slideshow. Requires make_slideshow_private to be Y
    # * allow_embeds: Sets if other websites should be allowed to embed the slideshow. Requires make_slideshow_private to be Y
    # * share_with_contacts: Sets if your contacts on SlideShare can view the slideshow. Requires make_slideshow_private to be Y
    # 
    # The document will upload into the account of the user specified by (username / password). The user associated with the API key need not be the
    # same as the user into who's account the slideshow gets uploaded. So, for example, a bulk uploader would include the api_key (and hash) associated
    # with the API account, and the username and password associated with the account being uploaded to.
    def upload_slideshow(options={})
      response = get("upload_slideshow/", options)
    end
    
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/add_favorite
    # Required parameters:
    # * username: Username of the requesting user
    # * password: Password of the requesting user
    # * slideshow_id: the slideshow to be favorited
    def add_favorite(options={})
      response = get("add_favorite/", options)
    end
    
    # Authorization: Required
    # URL: http://www.slideshare.net/api/2/check_favorite
    # Required parameters:
    # * username: username of the requesting user
    # * password: password of the requesting user
    # * slideshow_id: Slideshow which would be favorited
    def check_favorite(options={})
      response = get("check_favorite/", options)
    end
    
    # Authorization: Mandatory
    # URL: http://www.slideshare.net/api/2/get_user_campaigns
    # Required parameters:
    # * username: username of the requesting user
    # * password: password of the requesting user
    def get_user_campaigns(options={})
      response = get("get_user_campaigns/", options)
    end
    
    # Authorization: Mandatory
    # URL: http://www.slideshare.net/api/2/get_user_leads
    # Required parameters:
    # * username: username of the requesting user
    # * password: password of the requesting user
    # Optional parameters
    # * begin: only get leads collected after this UTC date: YYYYMMDDHHMM
    # * end: only get leads collected before this UTC date: YYYYMMDDHHMM
    # Note: January 18th, 2010.
    # We have changed the field to ,
    # For ruby/C people this is: strftime("%Y%m%d%H%M")
    # We realize that we asking for input dates in UTC, but give out information in MNT
    # time is funny, but we will fix this in the next revision
    def get_user_leads(options={})
      response = get("get_user_leads/", options)
    end
    
    # Authorization: Mandatory
    # URL: http://www.slideshare.net/api/2/get_user_campaign_leads
    # Required parameters:
    # * username: username of the requesting user
    # * password: password of the requesting user
    # * campaign_id: campaign_id to select the leads from
    # Optional parameters:
    # * begin: only get leads collected after this UTC date: YYYYMMDDHHMM
    # * end: only get leads collected before this UTC date: YYYYMMDDHHMM
    # Note: January 18th, 2010.
    # We have changed the field to ,
    # For ruby/C people this is: strftime("%Y%m%d%H%M")
    # We realize that we asking for input dates in UTC, but give out information in MNT
    # time is funny, but we will fix this in the next revision.
    def get_user_campaign_leads(options={})
      response = get("get_user_campaign_leads/", options)
    end
    
    def get_slideshow(options={})
      response = get("get_slideshow/", options)
    end
    
    def get_slideshow(options={})
      response = get("get_slideshow/", options)
    end
    
    def get_slideshow(options={})
      response = get("get_slideshow/", options)
    end
    
    def get_slideshow(options={})
      response = get("get_slideshow/", options)
    end
    
  end
end