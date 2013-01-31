require 'spec_helper'

describe TvRageWrapper::Api do
	
	it "should return the correct id for a show" do
		show = 'buffy'
		stub_get("/search.php?show=#{show}", "search.xml")
		TvRageWrapper::Api.get_id('buffy').should == '2930'
	end

end