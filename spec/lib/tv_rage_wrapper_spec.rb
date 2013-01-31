require 'spec_helper'

describe TvRageWrapper::Api do
	
	it "should return the correct id for a show" do
		show = 'buffy'
		stub_get("/search.php?show=#{show}")
			.to_return(
				body: fixture("search.xml"), 
				headers: {
					'Accept' => 'application/xml',
     			 	'Content-type' => 'application/xml',
      				'User-Agent' => 'Ruby',
      				'X-Trackertoken' => '12345'
				})
		TvRageWrapper::Api.getID('buffy').should == 2930
	end

end