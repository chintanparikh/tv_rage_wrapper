require 'tv_rage_wrapper'
require 'webmock/rspec'

def stub_get(path, file)
	stub_request(:get, TvRageWrapper::Api.base_uri + path)
			.to_return(
				body: fixture(file), 
				headers: {
					'Accept' => 'application/xml',
     			 	'Content-type' => 'application/xml'
				})
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end