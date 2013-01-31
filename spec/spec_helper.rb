require 'tv_rage_wrapper'
require 'webmock/rspec'

def stub_get(path)
	stub_request(:get, TvRageWrapper::Api.base_uri + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end