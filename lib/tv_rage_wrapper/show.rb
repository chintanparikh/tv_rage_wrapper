require 'httparty'

module TvRageWrapper
	class Show
		include HTTParty

		search_path '/search.php?show='
		episodes_path '/episode_list.php?sid='
 		
 		def initialize(name)
 			@name = name
 			@full_name
	        @episodes = Hash.new{ [] }
	        @genres = []
	        @id = ''
	        @country = ''
	        @status = ''
	        @classification = ''
	        @started = 0
	        @ended = 0
	        @seasons = 0

	        # Make the get request
	        response = self.get(Api::base_uri + search_path + name)
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
	        response = self.get(Api::base_uri + episodes_path + @showid)
	        data = response.parsed_response['Show']['Episodelist']['Season']
			
			episodes = Hash.new{ [] }
			data.each { |season|
			  episodes[season["no"].to_i] = season["episode"].inject({}) {|hash, elem| 
			  	hash.merge!(elem["seasonnum"].to_i => elem);
			  }.each do |hash, e| 
			  		if @episodes[season["no"].to_i].empty? 
			  			@episodes[season["no"].to_i] = Hash.new
			  		end
			  		@episodes[season["no"].to_i][e["epnum"].to_i] = Episode.new e["epnum"], e["seasonnum"], e["prodnum"], e["airdate"], e["link"], e["title"]
				end
			}

		end
	end
end