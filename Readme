# Super Mega Slideshare=

A ruby wrapper for Slideshare

## Example

    require 'rubygems'
    require 'slideshare'
    Slideshare.configure do |config|
    	config.api_key = "mlPF8lGR"
    	config.api_secret = "4A8hs0pa"
    end

    begin
    	Slideshare.get_slideshow(:slideshow_url => "http://www.slideshare.net/lolcats/lolcatz-2-minute-break-1",    :detailed => 1)
    rescue Slideshare::SlideshareError => e
    	puts e
    end

    begin
    	Slideshare.get_slideshows_by_tag(:tag => "lolcats")
    rescue Slideshare::SlideshareError => e
    	puts e
    end

## Contributors

Written by Edd Parris for NixonMcInnes, large parts copied with great thanks from the Twitter gem (https://github.com/jnunemaker/twitter)