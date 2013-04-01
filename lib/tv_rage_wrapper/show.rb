require 'httparty'

module TvRageWrapper
	class Show
		include HTTParty

		SEARCH_PATH = '/search.php?show='
		EPISODES_PATH = '/episode_list.php?sid='
 
		attr_reader :name, :full_name, :episodes, :genres, :id, :country, :status, :classification, :started, :ended, :seasons
 		
 		def initialize(name)
 			@name = name
 			@full_name = ''
                  @episodes = Hash.new{ [] }
                  @genres = []
                  @id = ''
                  @country = ''
                  @status = ''
                  @classification = ''
                  @started = 0
                  @ended = 0
                  @seasons = 0

                  # Make the get request to search for the show
                  response = self.class.get(Api::base_uri + SEARCH_PATH + name)
                  data = response.parsed_response['Results']['show'][0]

                  # Set instance variables
                  @full_name = data['name']
                  @genres = data['genres']['genre']
                  @id = data['showid']
                  @country = data['country']
                  @status = data['status']
                  @classification = data['classification']
                  @started = data['started']
                  @ended = data['ended']
                  @seasons = data['seasons']

                  ## Generate list of episodes and episode objects
                  response = self.class.get(Api::base_uri + EPISODES_PATH + @id)
                  data = response.parsed_response['Show']['Episodelist']['Season']
            			
            			episodes = Hash.new{ [] }
            			data.each { |season|
            			  episodes[season["no"].to_i] = season["episode"].inject({}) {|hash, elem| 
            			  	hash.merge!(elem["seasonnum"].to_i => elem);
            			  }.each do |hash, e| 
            			  		if @episodes[season["no"].to_i].empty? 
            			  			@episodes[season["no"].to_i] = Hash.new
            			  		end
            			  		@episodes[season["no"].to_i][e["seasonnum"].to_i] = Episode.new e["epnum"].to_i, e["seasonnum"].to_i, e["prodnum"].to_i, e["airdate"], e["link"], e["title"]
            				end
            			}
            		end
            	end
end