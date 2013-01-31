require 'httparty'
require 'debugger'

module TvRageWrapper
  # The main wrapper for the TVRageAPI
  # Search for show         - http://services.tvrage.com/feeds/search.php?show=SHOWNAME
  # Detailed search         - http://services.tvrage.com/feeds/full_search.php?show=SHOWNAME
  # Show info               - http://services.tvrage.com/feeds/showinfo.php?sid=SHOWID
  # Episode List            - http://services.tvrage.com/feeds/episode_list.php?sid=SHOWID
  # Episode Info            - http://services.tvrage.com/feeds/episodeinfo.php?show=Show Name&exact=1&ep=SEASONxEPISODE
  # Show Info, Episode List - http://services.tvrage.com/feeds/full_show_info.php?sid=SHOWID
  # Full Show List          - http://services.tvrage.com/feeds/show_list.php
  
  class Api
    include HTTParty
    base_uri 'http://services.tvrage.com/feeds'

  	def self.getID(show)
  		response = self.get("/search.php?show=#{show}")
      data = response.parsed_response
      debugger
      data['Results']['show']['showid']
  	end
  end
end