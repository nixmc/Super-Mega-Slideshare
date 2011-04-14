# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "slideshare/version"
#require File.expand_path('../lib/slideshare/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "super-mega-slideshare"
  s.version     = Slideshare::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Edd Parris"]
  s.email       = ["eddy@nixonmcinnes.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Wrapper for the Slideshare API}
  s.description = %q{Wrapper for the Slideshare API}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.post_install_message = "
  ****************************************************************
  Thank you for installing #{s.name}!
  ****************************************************************
  "
  
  s.add_runtime_dependency('faraday', '~> 0.5.4')
  s.add_runtime_dependency('faraday_middleware', '~> 0.3.2')
  s.add_runtime_dependency('nokogiri', '~> 1.4.4')
end
